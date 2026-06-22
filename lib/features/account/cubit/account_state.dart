part of 'account_cubit.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    @Default(true) bool notificationsEnabled,
    @Default(350.00) double walletBalance,
  }) = _AccountState;
}