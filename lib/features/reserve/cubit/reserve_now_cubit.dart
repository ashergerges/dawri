// lib/features/reserve_now/cubit/reserve_now_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/reserve/data/models/reserve_now_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reserve_now_state.dart';
part 'reserve_now_cubit.freezed.dart';

class ReserveNowCubit extends Cubit<ReserveNowState> {
  ReserveNowCubit() : super(const ReserveNowState());

  static const _pricePerHour = 250;

  int get selectedDuration => ReserveNowMockData.durations[state.selectedDurationIndex];

  int get totalPrice => (selectedDuration / 60 * _pricePerHour).round();

  void selectDuration(int index) {
    emit(state.copyWith(selectedDurationIndex: index));
  }

  void selectTimeSlot(int index) {
    if (ReserveNowMockData.timeSlots[index].isDisabled) return;
    emit(state.copyWith(selectedTimeSlotIndex: index));
  }

  void selectPayment(int index) {
    emit(state.copyWith(selectedPaymentIndex: index));
  }

  Future<void> confirmBooking() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}