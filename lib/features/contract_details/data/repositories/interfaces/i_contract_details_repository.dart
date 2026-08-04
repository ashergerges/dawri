import 'package:async/async.dart';
import 'package:dawri/features/contract_details/data/models/contract_details_model.dart';

abstract class IContractDetailsRepository {
  Future<Result<ContractDetailsModel>> getContractDetails({
    required int contractId,
  });
}
