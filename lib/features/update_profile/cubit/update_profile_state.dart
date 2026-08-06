part of 'update_profile_cubit.dart';

@freezed
abstract class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState({
    // ─── Editable fields (mirror the multipart body) ─────────
    @Default('') String name,
    @Default('') String email,
    @Default('') String birthDate,
    @Default('') String bio,
    int? cityId,
    int? dynamicId, // sport_position_id

    // ─── Read-only context ───────────────────────────────────
    /// Signed-in participant id — needed by the videos "see all" route.
    int? userId,
    @Default('') String phone,
    @Default('') String avatarPath,
    @Default(false) bool isLocalAvatar,
    XFile? avatarFile,

    /// Participant type — decides which list the role dropdown shows.
    int? typeId,

    /// Needed to scope player positions to the user's sport.
    int? sportId,

    // ─── Lookups ─────────────────────────────────────────────
    @Default([]) List<CityModel> cities,
    @Default([]) List<PlayerPositionModel> positions,
    @Default([]) List<RefereeRoleModel> refereeRoles,
    @Default([]) List<CoachSpecializationModel> coachSpecs,
    @Default(UpdateProfileStatus.initial()) UpdateProfileStatus loadStatus,
    @Default(UpdateProfileStatus.initial()) UpdateProfileStatus dynamicStatus,

    // ─── Validation / submit ─────────────────────────────────
    String? nameError,
    String? emailError,
    String? birthDateError,
    String? cityError,
    String? dynamicError,
    String? bioError,
    String? avatarError,
    @Default(false) bool isPickingAvatar,
    @Default(false) bool isUpdating,
    @Default(false) bool isSuccess,

    // ─── Reels ───────────────────────────────────────────────
    @Default([]) List<PartnerVideoModel> videos,
    @Default(UpdateProfileStatus.initial()) UpdateProfileStatus addVideoStatus,

    // ─── Account deactivation ────────────────────────────────
    @Default(UpdateProfileStatus.initial()) UpdateProfileStatus deactivateStatus,
  }) = _UpdateProfileState;

  const UpdateProfileState._();

  bool get isDeactivating => deactivateStatus is UpdateProfileStatusLoading;

  bool get isAddingVideo => addVideoStatus is UpdateProfileStatusLoading;

  /// Only the first few show inline — the rest live behind "see all".
  List<PartnerVideoModel> get previewVideos =>
      videos.take(UpdateProfileConstants.videosPreviewCount).toList();

  bool get hasMoreVideos =>
      videos.length >= UpdateProfileConstants.videosPreviewCount;

  bool get isLoading => loadStatus is UpdateProfileStatusLoading;

  bool get hasLoadError => loadStatus is UpdateProfileStatusError;

  bool get isDynamicLoading => dynamicStatus is UpdateProfileStatusLoading;

  /// Role options for the active participant type — same split the register
  /// flow uses (2 = Referee, 3 = Coach, otherwise player positions).
  List<({int id, String title})> get dynamicItems {
    switch (typeId) {
      case UpdateProfileConstants.refereeTypeId:
        return refereeRoles.map((e) => (id: e.id ?? 0, title: e.title ?? '')).toList();
      case UpdateProfileConstants.coachTypeId:
        return coachSpecs.map((e) => (id: e.id ?? 0, title: e.title ?? '')).toList();
      default:
        return positions.map((e) => (id: e.id ?? 0, title: e.title ?? '')).toList();
    }
  }

  /// Label above the role dropdown, matched to the participant type.
  String get dynamicLabelKey {
    switch (typeId) {
      case UpdateProfileConstants.refereeTypeId:
        return LocaleKeys.registerRefereeRoleLabel;
      case UpdateProfileConstants.coachTypeId:
        return LocaleKeys.registerCoachSpecLabel;
      default:
        return LocaleKeys.registerPositionLabel;
    }
  }

  /// Guards against a stale id lingering after the list swaps type.
  int? get safeDynamicId =>
      dynamicItems.any((e) => e.id == dynamicId) ? dynamicId : null;

  int? get safeCityId =>
      cities.any((e) => e.id == cityId) ? cityId : null;
}

@freezed
class UpdateProfileStatus with _$UpdateProfileStatus {
  const factory UpdateProfileStatus.initial() = UpdateProfileStatusInitial;
  const factory UpdateProfileStatus.loading() = UpdateProfileStatusLoading;
  const factory UpdateProfileStatus.success() = UpdateProfileStatusSuccess;
  const factory UpdateProfileStatus.error() = UpdateProfileStatusError;
}
