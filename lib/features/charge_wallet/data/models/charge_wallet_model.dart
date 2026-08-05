// lib/features/charge_wallet/data/models/charge_wallet_model.dart
import 'package:dawri/gen/locale_keys.g.dart';

/// Payment methods are presentation-only for now — the top-up endpoint does not
/// take a method, so the selection never leaves the screen.
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

/// Result of `api/app/user/wallet/top-up`.
///
/// The endpoint's response shape isn't fixed, so the balance is looked up under
/// the handful of keys the backend uses and left null when absent — the cubit
/// then falls back to `current + amount`.
class WalletTopUpModel {
  final double? balance;
  final String message;

  const WalletTopUpModel({this.balance, this.message = ''});

  factory WalletTopUpModel.fromResponse(Map<String, dynamic> json) {
    final data = json['data'];
    final map = data is Map ? Map<String, dynamic>.from(data) : const {};
    final wallet = map['wallet'];
    final walletMap = wallet is Map ? Map<String, dynamic>.from(wallet) : const {};

    final raw = map['balance'] ?? map['new_balance'] ?? walletMap['balance'];

    return WalletTopUpModel(
      balance: _toDouble(raw),
      message: (json['message'] ?? map['message'] ?? '').toString(),
    );
  }

  static double? _toDouble(Object? value) => switch (value) {
        num n => n.toDouble(),
        String s => double.tryParse(s),
        _ => null,
      };
}
