part of 'stadiums_cubit.dart';

@freezed
abstract class StadiumsState with _$StadiumsState {
  const factory StadiumsState({
    @Default(1) int selectedDateIndex,
    @Default(0) int selectedSportIndex,
    @Default([]) List<DateOption> dates,
    @Default(StadiumsMockData.sportKeys) List<String> sports,
    @Default(StadiumsMockData.stadiums) List<StadiumModel> stadiums,
  }) = _StadiumsState;
}