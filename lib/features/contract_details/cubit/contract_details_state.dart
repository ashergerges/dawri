part of 'contract_details_cubit.dart';

@freezed
abstract class ContractDetailsState with _$ContractDetailsState {
  const factory ContractDetailsState({
    @Default(ContractStatus.pending) ContractStatus status,
    @Default(false) bool isSigning,
    @Default(false) bool showSuccessModal,
  }) = _ContractDetailsState;
}