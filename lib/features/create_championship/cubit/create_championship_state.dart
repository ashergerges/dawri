// lib/features/championships/cubit/create_championship_state.dart
part of 'create_championship_cubit.dart';

@freezed
abstract class CreateChampionshipState with _$CreateChampionshipState {
  const factory CreateChampionshipState({
    @Default('') String name,
    @Default(SportType.football) SportType selectedSport,
    @Default(TournamentSystem.knockout) TournamentSystem selectedSystem,
    @Default('') String teams,
    @Default('') String fee,
    @Default('') String stadium,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String prizeFirst,
    @Default('') String prizeSecond,
    XFile? logoFile,
    @Default(CreateChampionshipStateStatus.initial())
    CreateChampionshipStateStatus currState,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _CreateChampionshipState;
}

@freezed
class CreateChampionshipStateStatus with _$CreateChampionshipStateStatus {
  const factory CreateChampionshipStateStatus.initial() = Initial;
  const factory CreateChampionshipStateStatus.loading() = Loading;
  const factory CreateChampionshipStateStatus.error() = Error;
  const factory CreateChampionshipStateStatus.success() = Success;
}