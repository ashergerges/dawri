part of 'reserve_now_cubit.dart';

@freezed
abstract class ReserveNowState with _$ReserveNowState {
  const factory ReserveNowState({
    // ─── Stadium details ─────────────────────────────────────
    StadiumModel? stadium,
    @Default(ReserveStatus.initial()) ReserveStatus stadiumStatus,

    // ─── Durations ───────────────────────────────────────────
    @Default([]) List<BookingDurationModel> durations,
    @Default(ReserveStatus.initial()) ReserveStatus durationsStatus,
    BookingDurationModel? selectedDuration,

    // ─── Slots ───────────────────────────────────────────────
    @Default([]) List<BookingSlotModel> slots,
    @Default(ReserveStatus.initial()) ReserveStatus slotsStatus,
    BookingSlotModel? selectedSlot,

    // ─── Payment (static) ────────────────────────────────────
    @Default(0) int selectedPaymentIndex,

    // ─── Booking submission ──────────────────────────────────
    @Default(ReserveStatus.initial()) ReserveStatus bookingStatus,
    String? bookingMessage,
  }) = _ReserveNowState;
}

@freezed
class ReserveStatus with _$ReserveStatus {
  const factory ReserveStatus.initial() = ReserveStatusInitial;
  const factory ReserveStatus.loading() = ReserveStatusLoading;
  const factory ReserveStatus.success() = ReserveStatusSuccess;
  const factory ReserveStatus.error() = ReserveStatusError;
}
