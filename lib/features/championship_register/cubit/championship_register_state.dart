part of 'championship_register_cubit.dart';

@freezed
abstract class ChampionshipRegisterState with _$ChampionshipRegisterState {
  const factory ChampionshipRegisterState({
    @Default(ParticipantRole.player) ParticipantRole selectedRole,
    @Default('') String fullName,
    @Default('') String phone,
    @Default('') String region,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _ChampionshipRegisterState;
}