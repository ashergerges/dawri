import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/contracts/data/models/contracts_model.dart';
import 'package:dawri/features/contracts/data/repositories/interfaces/i_contracts_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IContractsRepository)
class ContractsRepository implements IContractsRepository {
  final NetworkService networkService;

  ContractsRepository({required this.networkService});

  @override
  Future<Result<ContractsSummaryModel>> getContractsSummary() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.contractsSummaryUrl);
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      return Result.value(
        ContractsSummaryModel.fromJson(Map<String, dynamic>.from(data as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<ContractsPageModel>> getContracts({
    required int status,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.contractsUrl,
      queryParameters: {'status': status, 'limit': limit, 'page': page},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      // Tolerates `{data: {items: [...], pagination: {...}}}` and a bare list.
      final rawItems = data is Map ? (data['items'] as List? ?? []) : (data as List? ?? []);
      final rawPagination = data is Map ? data['pagination'] : null;

      return Result.value(ContractsPageModel(
        items: rawItems
            .map((e) => ContractModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        pagination: rawPagination is Map
            ? ContractsPaginationModel.fromJson(rawPagination)
            : null,
      ));
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> respondToContract({
    required int contractId,
    required int status,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.contractStatusUrl,
      body: {'contract_id': contractId, 'status': status},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
