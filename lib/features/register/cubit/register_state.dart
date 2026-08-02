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
    int? sportId,
    int? dynamicId, // player position / referee role / coach specialization
    XFile? avatarFile,

    // ─── Lookups ─────────────────────────────────────────────
    @Default([]) List<ParticipantTypeModel> types,
    @Default([]) List<SportModel> sports,
    @Default([]) List<CityModel> cities,
    @Default([]) List<PlayerPositionModel> positions,
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
    String? dynamicError,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
  }) = _RegisterState;

  const RegisterState._();

  /// Dynamic-field items for the active participant type (2=Referee, 3=Coach,
  /// otherwise Player positions).
  List<({int id, String title})> get dynamicItems {
    switch (typeId) {
      case 2:
        return refereeRoles.map((e) => (id: e.id ?? 0, title: e.title ?? '')).toList();
      case 3:
        return coachSpecs.map((e) => (id: e.id ?? 0, title: e.title ?? '')).toList();
      default:
        return positions.map((e) => (id: e.id ?? 0, title: e.title ?? '')).toList();
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
