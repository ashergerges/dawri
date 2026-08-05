// lib/features/charge_wallet/cubit/charge_wallet_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/charge_wallet/data/models/charge_wallet_model.dart';
import 'package:dawri/features/charge_wallet/data/repositories/interfaces/i_charge_wallet_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'charge_wallet_state.dart';
part 'charge_wallet_cubit.freezed.dart';

class ChargeWalletCubit extends Cubit<ChargeWalletState> {
  ChargeWalletCubit({required double currentBalance})
      : _repository = getIt<IChargeWalletRepository>(),
        super(ChargeWalletState(
          balance: currentBalance,
          selectedAmount: ChargeWalletMockData.defaultAmount,
          selectedChip: ChargeWalletMockData.defaultAmount,
        ));

  final IChargeWalletRepository _repository;

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

  /// UI-only: the top-up endpoint takes no payment method.
  void selectPaymentMethod(PaymentMethod method) {
    emit(state.copyWith(selectedMethod: method));
  }

  Future<void> pay() async {
    if (state.selectedAmount <= 0 || state.isPaying) return;

    final amount = state.selectedAmount;
    emit(state.copyWith(isPaying: true));

    final result = await _repository.topUp(amount: amount);

    if (result.isError) {
      emit(state.copyWith(isPaying: false));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    // Prefer the balance the server reports; otherwise add locally.
    final newBalance = result.asValue!.value.balance ?? (state.balance + amount);
    _persistBalance(newBalance);

    emit(state.copyWith(
      isPaying: false,
      balance: newBalance,
      chargedAmount: amount,
      showSuccessModal: true,
    ));
  }

  /// Keeps the cached user in sync so the account screen shows the new balance.
  void _persistBalance(double balance) {
    final preference = getIt<ILocalPreference>();
    final user = preference.appUser.value;
    if (user == null) return;
    preference.saveAppUser(user.copyWith(balance: balance.toStringAsFixed(2)));
  }

  void closeModal() {
    emit(state.copyWith(showSuccessModal: false));
  }
}
