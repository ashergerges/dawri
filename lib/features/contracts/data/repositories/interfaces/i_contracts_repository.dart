import 'package:async/async.dart';
import 'package:dawri/features/contracts/data/models/contracts_model.dart';

abstract class IContractsRepository {
  Future<Result<ContractsSummaryModel>> getContractsSummary();

  Future<Result<ContractsPageModel>> getContracts({
    required int status,
    required int page,
    int limit = 10,
  });

  Future<Result<String>> respondToContract({
    required int contractId,
    required int status,
  });
}
