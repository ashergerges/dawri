// lib/features/register/cubit/register_state.dart
part of 'register_cubit.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String name,
    @Default('') String bio,
    @Default('') String birthDate,
    int? cityId,
    int? typeId,
    /// A participant can practise several activities — order follows the taps.
    @Default(<int>[]) List<int> sportIds,

    /// Position picked for each selected sport, keyed by sport id. Players only.
    @Default(<int, int>{}) Map<int, int> sportPositionIds,
    int? dynamicId, // referee role / coach specialization
    XFile? avatarFile,

    // ─── Lookups ─────────────────────────────────────────────
    @Default([]) List<ParticipantTypeModel> types,
    @Default([]) List<SportModel> sports,
    @Default([]) List<CityModel> cities,
    /// Positions available per sport, keyed by sport id. Cached so re-selecting
    /// a sport doesn't hit the network again.
    @Default(<int, List<PlayerPositionModel>>{})
    Map<int, List<PlayerPositionModel>> positionsBySport,

    /// Sports whose positions are still in flight.
    @Default(<int>[]) List<int> loadingPositionSportIds,
    @Default([]) List<RefereeRoleModel> refereeRoles,
    @Default([]) List<CoachSpecializationModel> coachSpecs,
    @Default(RegisterStatus.initial()) RegisterStatus optionsStatus,
    @Default(RegisterStatus.initial()) RegisterStatus dynamicStatus,

    // ─── Validation / submit ─────────────────────────────────
    String? nameError,
    String? bioError,
    String? avatarError,
    String? birthDateError,
    String? cityError,
    String? sportError,
    String? sportPositionError,
    String? dynamicError,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
  }) = _RegisterState;

  const RegisterState._();

  /// Only Referee(2) and Coach(3) carry an extra single-choice field. Players
  /// instead pick a position for every activity they selected.
  bool get hasDynamicField => typeId == 2 || typeId == 3;

  /// Selected sports paired with their title and the position picked for them,
  /// in tap order — what the per-sport position section renders.
  List<({int sportId, String title, int? positionId})> get selectedSports =>
      sportIds.map((id) {
        String title = '';
        for (final s in sports) {
          if (s.id == id) {
            title = s.title ?? '';
            break;
          }
        }
        return (sportId: id, title: title, positionId: sportPositionIds[id]);
      }).toList();

  /// Every picked activity needs a position before the form can be submitted.
  /// Sports with no positions are de-selected as soon as that is known, so they
  /// never reach this check — `sport_id` is never sent without its position.
  bool get allPositionsPicked =>
      sportIds.every((id) => sportPositionIds[id] != null);

  /// Dynamic-field items for the active participant type.
  List<({int id, String title})> get dynamicItems {
    switch (typeId) {
      case 2:
        return refereeRoles.map((e) => (id: e.id ?? 0, title: e.title ?? '')).toList();
      case 3:
        return coachSpecs.map((e) => (id: e.id ?? 0, title: e.title ?? '')).toList();
      default:
        return const [];
    }
  }
}

@freezed
class RegisterStatus with _$RegisterStatus {
  const factory RegisterStatus.initial() = RegisterStatusInitial;
  const factory RegisterStatus.loading() = RegisterStatusLoading;
  const factory RegisterStatus.success() = RegisterStatusSuccess;
  const factory RegisterStatus.error() = RegisterStatusError;
}
