part of 'create_team_cubit.dart';

@freezed
abstract class CreateTeamState with _$CreateTeamState {
  const factory CreateTeamState({
    @Default('') String teamName,
    @Default('') String description,

    // ─── Options (from API) ──────────────────────────────────
    @Default([]) List<CityModel> cities,
    @Default([]) List<SportModel> sports,
    @Default(false) bool isLoadingOptions,

    // ─── Selection ───────────────────────────────────────────
    int? selectedCityId,
    int? selectedSportId,
    XFile? logoFile,

    // ─── Validation / submission ─────────────────────────────
    String? teamNameError,
    String? sportError,
    String? cityError,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
  }) = _CreateTeamState;
}
