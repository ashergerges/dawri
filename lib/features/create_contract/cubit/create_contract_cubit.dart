// lib/features/create_contract/cubit/create_contract_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/create_contract/data/models/create_contract_model.dart';

part 'create_contract_state.dart';
part 'create_contract_cubit.freezed.dart';

class CreateContractCubit extends Cubit<CreateContractState> {
  CreateContractCubit() : super(const CreateContractState());

  void selectType(ContractType type) {
    emit(state.copyWith(selectedType: type));
  }

  void selectPaymentType(PaymentType type) {
    emit(state.copyWith(selectedPaymentType: type));
  }

  void updateTotalHours(String value) {
    emit(state.copyWith(totalHours: value));
  }

  void updateContractValue(String value) {
    emit(state.copyWith(contractValue: value));
  }

  void updateNotes(String value) {
    emit(state.copyWith(notes: value));
  }

  Future<void> sendContractOffer() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 800));
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}