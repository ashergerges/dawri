// lib/features/charge_wallet/cubit/charge_wallet_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/charge_wallet/data/models/charge_wallet_model.dart';

part 'charge_wallet_state.dart';
part 'charge_wallet_cubit.freezed.dart';

class ChargeWalletCubit extends Cubit<ChargeWalletState> {
  ChargeWalletCubit() : super(const ChargeWalletState(
    selectedAmount: ChargeWalletMockData.defaultAmount,
    selectedChip: ChargeWalletMockData.defaultAmount,
  ));

  void selectChip(double amount) {
    emit(state.copyWith(selectedChip: amount, selectedAmount: amount, customInput: ''));
  }

  void updateCustomInput(String value) {
    final parsed = double.tryParse(value);
    emit(state.copyWith(
      customInput: value,
      selectedChip: null,
      selectedAmount: parsed ?? 0,
    ));
  }

  void selectPaymentMethod(PaymentMethod method) {
    emit(state.copyWith(selectedMethod: method));
  }

  Future<void> pay() async {
    if (state.selectedAmount <= 0 || state.isPaying) return;
    emit(state.copyWith(isPaying: true));
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(state.copyWith(isPaying: false, showSuccessModal: true));
  }

  void closeModal() {
    emit(state.copyWith(showSuccessModal: false));
  }
}