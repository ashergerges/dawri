// lib/features/reserve/cubit/reserve_now_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/reserve/data/models/reserve_now_model.dart';
import 'package:dawri/features/reserve/data/repositories/interfaces/i_reserve_repository.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reserve_now_state.dart';
part 'reserve_now_cubit.freezed.dart';

class ReserveNowCubit extends Cubit<ReserveNowState> {
  ReserveNowCubit({required this.stadiumId, String? date})
      : date = date ?? _todayIso(),
        _repository = getIt<IReserveRepository>(),
        super(const ReserveNowState());

  final int stadiumId;
  final String date;
  final IReserveRepository _repository;

  static String _todayIso() {
    final now = DateTime.now();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${now.year}-${two(now.month)}-${two(now.day)}';
  }

  // ─── Load sequence ─────────────────────────────────────────────────────────
  Future<void> init() async {
    await Future.wait([getStadiumDetails(), getBookingDurations()]);

    // Default to the first duration, then load its slots.
    if (state.durations.isNotEmpty) {
      emit(state.copyWith(selectedDuration: state.durations.first));
      await getSlots();
    }
  }

  Future<void> getStadiumDetails() async {
    emit(state.copyWith(stadiumStatus: const ReserveStatus.loading()));
    final result = await _repository.getStadiumDetails(stadiumId);
    if (result.isError) {
      emit(state.copyWith(stadiumStatus: const ReserveStatus.error()));
      return;
    }
    emit(state.copyWith(
      stadiumStatus: const ReserveStatus.success(),
      stadium: result.asValue!.value,
    ));
  }

  Future<void> getBookingDurations() async {
    emit(state.copyWith(durationsStatus: const ReserveStatus.loading()));
    final result = await _repository.getBookingDurations();
    if (result.isError) {
      emit(state.copyWith(durationsStatus: const ReserveStatus.error()));
      return;
    }
    emit(state.copyWith(
      durationsStatus: const ReserveStatus.success(),
      durations: result.asValue!.value,
    ));
  }

  Future<void> getSlots() async {
    final minutes = state.selectedDuration?.minutes;
    if (minutes == null) return;

    emit(state.copyWith(
      slotsStatus: const ReserveStatus.loading(),
      slots: const [],
    ));

    final result = await _repository.getSlots(
      stadiumId: stadiumId,
      date: date,
      durationMinutes: minutes,
    );
    if (result.isError) {
      emit(state.copyWith(slotsStatus: const ReserveStatus.error()));
      return;
    }
    emit(state.copyWith(
      slotsStatus: const ReserveStatus.success(),
      slots: result.asValue!.value,
    ));
  }

  // ─── Selection ─────────────────────────────────────────────────────────────
  Future<void> selectDuration(BookingDurationModel duration) async {
    if (state.selectedDuration?.minutes == duration.minutes) return;
    // Changing duration invalidates the picked slot.
    emit(state.copyWith(selectedDuration: duration, selectedSlot: null));
    await getSlots();
  }

  void selectSlot(BookingSlotModel slot) {
    if (!slot.available) return;
    emit(state.copyWith(selectedSlot: slot));
  }

  void selectPayment(int index) => emit(state.copyWith(selectedPaymentIndex: index));

  // ─── Price ───────────────────────────────────────────────────────────────────
  double get _hours => (state.selectedDuration?.minutes ?? 0) / 60;

  num get originalPrice => (state.stadium?.pricePerHour ?? 0) * _hours;

  bool get hasDiscount => (state.stadium?.discountPercentage ?? 0) > 0;

  num get finalPrice {
    if (!hasDiscount) return originalPrice;
    final discount = state.stadium!.discountPercentage!;
    return originalPrice * (100 - discount) / 100;
  }

  bool get canConfirm =>
      state.selectedDuration != null && state.selectedSlot != null;

  // ─── Confirm ───────────────────────────────────────────────────────────────
  Future<void> confirmBooking() async {
    if (!canConfirm || state.bookingStatus is ReserveStatusLoading) return;

    emit(state.copyWith(bookingStatus: const ReserveStatus.loading()));

    final result = await _repository.createBooking(
      stadiumId: stadiumId,
      bookingDate: date,
      startTime: state.selectedSlot!.startTime ?? '',
      durationMinutes: state.selectedDuration!.minutes ?? 0,
    );

    if (result.isError) {
      emit(state.copyWith(bookingStatus: const ReserveStatus.error()));
      return;
    }

    emit(state.copyWith(
      bookingStatus: const ReserveStatus.success(),
      bookingMessage: result.asValue!.value,
    ));
  }
}
