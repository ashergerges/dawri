part of 'champ_profile_cubit.dart';

@freezed
abstract class ChampProfileState with _$ChampProfileState {
  const factory ChampProfileState({
    @Default(ChampTab.info) ChampTab selectedTab,
    @Default(false) bool isFav,
    @Default(false) bool isRegistering,
    @Default(false) bool isRegistered,
    @Default(false) bool showSuccessModal,
  }) = _ChampProfileState;
}