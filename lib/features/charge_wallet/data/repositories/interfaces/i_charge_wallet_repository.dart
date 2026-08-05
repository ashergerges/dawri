import 'package:async/async.dart';
import 'package:dawri/features/charge_wallet/data/models/charge_wallet_model.dart';

abstract class IChargeWalletRepository {
  Future<Result<WalletTopUpModel>> topUp({required double amount});
}
