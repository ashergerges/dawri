part of 'charge_wallet_cubit.dart';

@freezed
abstract class ChargeWalletState with _$ChargeWalletState {
  const factory ChargeWalletState({
    @Default(0.0) double selectedAmount,
    double? selectedChip,
    @Default('') String customInput,
    @Default(PaymentMethod.applePay) PaymentMethod selectedMethod,
    @Default(false) bool isPaying,
    @Default(false) bool showSuccessModal,
  }) = _ChargeWalletState;
}