// lib/features/contracts/cubit/contracts_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/contracts/data/models/contracts_model.dart';

part 'contracts_state.dart';
part 'contracts_cubit.freezed.dart';

class ContractsCubit extends Cubit<ContractsState> {
  ContractsCubit() : super(const ContractsState());

  void selectTab(int index) {
    emit(state.copyWith(selectedTabIndex: index));
  }

  /// Accepting a pending offer moves it out of "pending" and into "active"
  /// contracts (kept generic since the resulting active-contract shape
  /// differs per offer type; here we simply remove it from pending).
  void acceptOffer(String contractId) {
    final updated = state.pendingContracts.where((c) => c.id != contractId).toList();
    emit(state.copyWith(pendingContracts: updated));
  }

  void rejectOffer(String contractId) {
    final updated = state.pendingContracts.where((c) => c.id != contractId).toList();
    emit(state.copyWith(pendingContracts: updated));
  }
}