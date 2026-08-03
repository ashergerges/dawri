import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/create_contract/data/models/create_contract_model.dart';
import 'package:dawri/features/create_contract/data/repositories/interfaces/i_create_contract_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICreateContractRepository)
class CreateContractRepository implements ICreateContractRepository {
  final NetworkService networkService;

  CreateContractRepository({required this.networkService});

  @override
  Future<Result<List<ContractTypeModel>>> getContractTypes() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.contractTypesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => ContractTypeModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<List<SalaryTypeModel>>> getSalaryTypes() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.salaryTypesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => SalaryTypeModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<String>> createContract({
    required int userId,
    required int contractTypeId,
    required int salaryType,
    required num amount,
    required String startDate,
    required String endDate,
    required int totalHours,
    required String notes,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.createContractUrl,
      body: {
        'user_id': userId,
        'contract_type_id': contractTypeId,
        'salary_type': salaryType,
        'amount': amount,
        'start_date': startDate,
        'end_date': endDate,
        'total_hours': totalHours,
        'notes': notes,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
