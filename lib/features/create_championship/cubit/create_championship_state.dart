part of 'create_championship_cubit.dart';

@freezed
abstract class CreateChampionshipState with _$CreateChampionshipState {
  const factory CreateChampionshipState({
    @Default('') String name,
    @Default('') String teams,
    @Default('') String fee,
    int? selectedCityId,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String prizeFirst,
    @Default('') String prizeSecond,

    XFile? logoFile,
  XFile? coverImage,
  @Default('') String about,
    // ─── Options loaded from APIs ───────────────────────────
    @Default([]) List<SportModel> sports,
    @Default([]) List<ChampionshipTypeModel> championshipTypes,
    @Default([]) List<RegistrationModeModel> registrationModes,
    @Default([]) List<CityModel> cities,
    int? selectedSportId,
    int? selectedChampionshipTypeId,
    int? selectedRegistrationModeId,
    @Default(CreateChampionshipStateStatus.initial())
    CreateChampionshipStateStatus optionsStatus,

    // ─── Submit status ───────────────────────────────────────
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