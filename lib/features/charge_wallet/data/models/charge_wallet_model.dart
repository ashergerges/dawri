// lib/features/charge_wallet/data/charge_wallet_model.dart
import 'package:dawri/gen/locale_keys.g.dart';

enum PaymentMethod { applePay, mada, card }

class AmountChip {
  final double amount;
  const AmountChip(this.amount);
}

class PaymentMethodData {
  final PaymentMethod method;
  final String labelKey;
  const PaymentMethodData({required this.method, required this.labelKey});
}

class ChargeWalletMockData {
  static const currentBalance = 125.50;
  static const defaultAmount = 100.0;

  static const amountChips = [
    AmountChip(50),
    AmountChip(100),
    AmountChip(200),
    AmountChip(500),
    AmountChip(1000),
  ];

  static const paymentMethods = [
    PaymentMethodData(method: PaymentMethod.applePay, labelKey: LocaleKeys.walletMethodApplePay),
    PaymentMethodData(method: PaymentMethod.mada,     labelKey: LocaleKeys.walletMethodMada),
    PaymentMethodData(method: PaymentMethod.card,     labelKey: LocaleKeys.walletMethodCard),
  ];
}