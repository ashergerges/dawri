part of 'contracts_cubit.dart';

@freezed
abstract class ContractsState with _$ContractsState {
  const factory ContractsState({
    @Default(0) int selectedTabIndex,
    @Default(ContractsMockData.pendingContracts) List<PendingContractModel> pendingContracts,
    @Default(ContractsMockData.activeContracts) List<ActiveContractModel> activeContracts,
    @Default(ContractsMockData.historyContracts) List<HistoryContractModel> historyContracts,
  }) = _ContractsState;
}