part of 'stadiums_cubit.dart';

@freezed
abstract class StadiumsState with _$StadiumsState {
  const factory StadiumsState({
    @Default(0) int selectedDateIndex,
    @Default(0) int selectedSportIndex,
    @Default([]) List<DateOption> dates,
    @Default([]) List<SportModel> sports,
    @Default([]) List<StadiumModel> stadiums,
    @Default(StadiumsStatus.initial()) StadiumsStatus status,
    @Default(1) int page,
  }) = _StadiumsState;
}

@freezed
class StadiumsStatus with _$StadiumsStatus {
  const factory StadiumsStatus.initial() = StadiumsStatusInitial;
  const factory StadiumsStatus.loading() = StadiumsStatusLoading;
  const factory StadiumsStatus.success() = StadiumsStatusSuccess;
  const factory StadiumsStatus.error() = StadiumsStatusError;
}
