part of 'reserve_now_cubit.dart';

@freezed
abstract class ReserveNowState with _$ReserveNowState {
  const factory ReserveNowState({
    @Default(1) int selectedDurationIndex,
    @Default(3) int selectedTimeSlotIndex,
    @Default(0) int selectedPaymentIndex,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _ReserveNowState;
}