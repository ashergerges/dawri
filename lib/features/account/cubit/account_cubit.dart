// lib/features/account/cubit/account_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.dart';
part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState());

  void toggleNotifications(bool value) {
    emit(state.copyWith(notificationsEnabled: value));
  }

  void logout() {
    // TODO: hook into auth/session logic
  }
}