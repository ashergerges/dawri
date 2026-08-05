part of 'charge_wallet_cubit.dart';

@freezed
abstract class ChargeWalletState with _$ChargeWalletState {
  const factory ChargeWalletState({
    /// Live wallet balance — seeded from the account screen, updated on top-up.
    @Default(0.0) double balance,
    @Default(0.0) double selectedAmount,
    double? selectedChip,
    @Default('') String customInput,
    @Default(PaymentMethod.applePay) PaymentMethod selectedMethod,
    @Default(false) bool isPaying,

    /// Amount of the last successful top-up — what the success modal shows.
    @Default(0.0) double chargedAmount,
    @Default(false) bool showSuccessModal,
  }) = _ChargeWalletState;
}
