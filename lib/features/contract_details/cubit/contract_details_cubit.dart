// lib/features/contract_details/cubit/contract_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/contract_details/data/models/contract_details_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'contract_details_state.dart';
part 'contract_details_cubit.freezed.dart';

class ContractDetailsCubit extends Cubit<ContractDetailsState> {
  ContractDetailsCubit() : super(const ContractDetailsState());

  Future<void> signContract() async {
    if (state.isSigning) return;
    emit(state.copyWith(isSigning: true));
    await Future.delayed(const Duration(milliseconds: 1200));
    emit(state.copyWith(isSigning: false, status: ContractStatus.signed, showSuccessModal: true));
  }

  void rejectContract() {
    emit(state.copyWith(status: ContractStatus.rejected));
  }

  void closeModal() {
    emit(state.copyWith(showSuccessModal: false));
  }
}