import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/charge_wallet/data/models/charge_wallet_model.dart';
import 'package:dawri/features/charge_wallet/data/repositories/interfaces/i_charge_wallet_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IChargeWalletRepository)
class ChargeWalletRepository implements IChargeWalletRepository {
  final NetworkService networkService;

  ChargeWalletRepository({required this.networkService});

  @override
  Future<Result<WalletTopUpModel>> topUp({required double amount}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.walletTopUpUrl,
      body: {'amount': amount},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data;
      return Result.value(
        WalletTopUpModel.fromResponse(Map<String, dynamic>.from(data as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }
}
