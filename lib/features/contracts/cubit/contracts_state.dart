part of 'contracts_cubit.dart';

@freezed
abstract class ContractsState with _$ContractsState {
  const factory ContractsState({
    @Default(0) int selectedTabIndex,

    // ─── Summary (independent of the tabs) ───────────────────
    ContractsSummaryModel? summary,
    @Default(ContractsStatus.initial()) ContractsStatus summaryStatus,

    // ─── Pending (status = 1) ────────────────────────────────
    @Default([]) List<ContractModel> pendingContracts,
    @Default(1) int pendingPage,
    ContractsPaginationModel? pendingPagination,
    @Default(ContractsStatus.initial()) ContractsStatus pendingStatus,

    // ─── Active (status = 2) ─────────────────────────────────
    @Default([]) List<ContractModel> activeContracts,
    @Default(1) int activePage,
    ContractsPaginationModel? activePagination,
    @Default(ContractsStatus.initial()) ContractsStatus activeStatus,

    // ─── Rejected (status = 3) ───────────────────────────────
    @Default([]) List<ContractModel> rejectedContracts,
    @Default(1) int rejectedPage,
    ContractsPaginationModel? rejectedPagination,
    @Default(ContractsStatus.initial()) ContractsStatus rejectedStatus,

    // ─── Accept / reject request ─────────────────────────────
    @Default(ContractsStatus.initial()) ContractsStatus responseStatus,
    int? respondingContractId,
  }) = _ContractsState;

  const ContractsState._();

  bool get isLoadingSummary => summaryStatus is ContractsStatusLoading;
  bool get isResponding => responseStatus is ContractsStatusLoading;

  int get activeCount => summary?.active ?? 0;
  int get pendingCount => summary?.pending ?? 0;
}

@freezed
class ContractsStatus with _$ContractsStatus {
  const factory ContractsStatus.initial() = ContractsStatusInitial;
  const factory ContractsStatus.loading() = ContractsStatusLoading;
  const factory ContractsStatus.error() = ContractsStatusError;
  const factory ContractsStatus.success() = ContractsStatusSuccess;
}
