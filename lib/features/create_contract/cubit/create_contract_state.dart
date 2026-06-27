part of 'create_contract_cubit.dart';

@freezed
abstract class CreateContractState with _$CreateContractState {
  const factory CreateContractState({
    @Default(ContractType.coaching) ContractType selectedType,
    @Default(PaymentType.oneTime) PaymentType selectedPaymentType,
    @Default('') String totalHours,
    @Default('') String contractValue,
    @Default('') String notes,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _CreateContractState;
}