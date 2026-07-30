// lib/features/create_challenge/cubit/create_challenge_state.dart
part of 'create_challenge_cubit.dart';

@freezed
abstract class CreateChallengeState with _$CreateChallengeState {
 const factory CreateChallengeState({
  @Default([]) List<SportModel> sports,
  @Default([]) List<CityModel> cities,
  @Default([]) List<LevelModel> levels,
  @Default([]) List<StadiumModel> stadiums,
  int? selectedSportId,
  int? selectedCityId,
  int? selectedStadiumId,
  int? selectedLevelId,
  @Default(1) int playersPerTeam,
  @Default('') String description,
  DateTime? date,
  TimeOfDay? time,
  @Default(CreateChallengeStatus.initial()) CreateChallengeStatus status,
  @Default(false) bool isSubmitting,
  @Default(false) bool showSuccessModal,
 }) = _CreateChallengeState;
}

@freezed
class CreateChallengeStatus with _$CreateChallengeStatus {
 const factory CreateChallengeStatus.initial() = CreateChallengeStatusInitial;
 const factory CreateChallengeStatus.loading() = CreateChallengeStatusLoading;
 const factory CreateChallengeStatus.success() = CreateChallengeStatusSuccess;
 const factory CreateChallengeStatus.error() = CreateChallengeStatusError;
}