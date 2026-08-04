import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/contract_details/data/models/contract_details_model.dart';
import 'package:dawri/features/contract_details/data/repositories/interfaces/i_contract_details_repository.dart';
import 'package:injectable/injectable.dart';

/// Only the details call lives here — accept / reject reuses
/// `IContractsRepository.respondToContract` (same endpoint and body).
@Injectable(as: IContractDetailsRepository)
class ContractDetailsRepository implements IContractDetailsRepository {
  final NetworkService networkService;

  ContractDetailsRepository({required this.networkService});

  @override
  Future<Result<ContractDetailsModel>> getContractDetails({
    required int contractId,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.contractDetailsUrl,
      queryParameters: {'contract_id': contractId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      return Result.value(
        ContractDetailsModel.fromJson(Map<String, dynamic>.from(data as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }
}
