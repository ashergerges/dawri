part of 'create_contract_cubit.dart';

@freezed
abstract class CreateContractState with _$CreateContractState {
  const factory CreateContractState({
    // ─── Lookups ─────────────────────────────────────────────
    @Default([]) List<ContractTypeModel> contractTypes,
    @Default([]) List<SalaryTypeModel> salaryTypes,
    @Default(CreateContractStatus.initial()) CreateContractStatus optionsStatus,

    // ─── Form fields (all required) ──────────────────────────
    int? selectedContractTypeId,
    int? selectedSalaryTypeId,
    @Default('') String amount,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String totalHours,
    @Default('') String notes,

    // ─── Submit ──────────────────────────────────────────────
    @Default(CreateContractStatus.initial()) CreateContractStatus submitStatus,
    @Default(false) bool isSuccess,
  }) = _CreateContractState;

  const CreateContractState._();

  bool get isLoadingOptions => optionsStatus is CreateContractStatusLoading;
  bool get isSubmitting => submitStatus is CreateContractStatusLoading;

  /// The slug (`once` / `monthly` / `match`) of the picked salary type — kept
  /// available for conditional field logic; the form shows every field always.
  String? get selectedSalaryTypeValue {
    for (final type in salaryTypes) {
      if (type.id == selectedSalaryTypeId) return type.value;
    }
    return null;
  }

  /// Submit stays disabled until every required field holds a valid value.
  bool get isFormComplete =>
      selectedContractTypeId != null &&
      selectedSalaryTypeId != null &&
      (num.tryParse(amount.trim()) ?? 0) > 0 &&
      startDate.trim().isNotEmpty &&
      endDate.trim().isNotEmpty &&
      (int.tryParse(totalHours.trim()) ?? 0) > 0 &&
      notes.trim().isNotEmpty;
}

@freezed
class CreateContractStatus with _$CreateContractStatus {
  const factory CreateContractStatus.initial() = CreateContractStatusInitial;
  const factory CreateContractStatus.loading() = CreateContractStatusLoading;
  const factory CreateContractStatus.error() = CreateContractStatusError;
  const factory CreateContractStatus.success() = CreateContractStatusSuccess;
}
