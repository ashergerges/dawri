import 'package:async/async.dart';
import 'package:dawri/features/create_contract/data/models/create_contract_model.dart';

abstract class ICreateContractRepository {
  Future<Result<List<ContractTypeModel>>> getContractTypes();

  Future<Result<List<SalaryTypeModel>>> getSalaryTypes();

  Future<Result<String>> createContract({
    required int userId,
    required int contractTypeId,
    required int salaryType,
    required num amount,
    required String startDate,
    required String endDate,
    required int totalHours,
    required String notes,
  });
}
