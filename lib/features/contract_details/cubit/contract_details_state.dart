part of 'contract_details_cubit.dart';

@freezed
abstract class ContractDetailsState with _$ContractDetailsState {
  const factory ContractDetailsState({
    ContractDetailsModel? contract,
    @Default(ContractDetailsStatus.initial()) ContractDetailsStatus detailsStatus,

    /// Kept apart so only the accept / reject buttons react to it.
    @Default(ContractDetailsStatus.initial()) ContractDetailsStatus respondStatus,

    /// True once this screen accepted or rejected the contract.
    @Default(false) bool didChangeStatus,
  }) = _ContractDetailsState;

  const ContractDetailsState._();

  bool get isFirstLoad => detailsStatus is ContractDetailsStatusLoading && contract == null;
  bool get hasFailed => detailsStatus is ContractDetailsStatusError && contract == null;
  bool get isResponding => respondStatus is ContractDetailsStatusLoading;

  ContractStatus get status => contract?.statusEnum ?? ContractStatus.pending;

  /// The action bar exists only while the contract awaits the player's answer.
  bool get showActions => contract?.isPending == true;
}

@freezed
class ContractDetailsStatus with _$ContractDetailsStatus {
  const factory ContractDetailsStatus.initial() = ContractDetailsStatusInitial;
  const factory ContractDetailsStatus.loading() = ContractDetailsStatusLoading;
  const factory ContractDetailsStatus.error() = ContractDetailsStatusError;
  const factory ContractDetailsStatus.success() = ContractDetailsStatusSuccess;
}
