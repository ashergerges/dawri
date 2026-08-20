// lib/features/register/cubit/register_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/services/firebase/firebase_user_sync_service.dart';
import 'package:dawri/core/utils/helper/picked_image_helper.dart';
import 'package:dawri/features/common/data/local/models/app_user.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:dawri/features/register/data/repositories/interfaces/i_register_repository.dart';
import 'package:dawri/features/register/models/register_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : _repository = getIt<IRegisterRepository>(),
        super(const RegisterState());

  final IRegisterRepository _repository;
  final ImagePicker _picker = ImagePicker();

  // ─── Load lookups ────────────────────────────────────────────────────────────
  Future<void> init() async {
    emit(state.copyWith(optionsStatus: const RegisterStatus.loading()));

    final typesResult = await _repository.getParticipantTypes();
    final sportsResult = await _repository.getSports();
    final citiesResult = await _repository.getCities();

    if (typesResult.isError || sportsResult.isError || citiesResult.isError) {
      emit(state.copyWith(optionsStatus: const RegisterStatus.error()));
      return;
    }

    // Only Player(1) / Referee(2) / Coach(3) — exclude Fan(4) & Team(5).
    final types = typesResult.asValue!.value
        .where((t) => t.id != 4 && t.id != 5)
        .toList();

    emit(state.copyWith(
      optionsStatus: const RegisterStatus.success(),
      types: types,
      sports: sportsResult.asValue!.value,
      cities: citiesResult.asValue!.value,
      typeId: types.isNotEmpty ? types.first.id : null,
    ));

    await loadDynamic();
  }

  Future<void> loadDynamic() async {
    final type = state.typeId;
    if (type == null) return;

    emit(state.copyWith(dynamicStatus: const RegisterStatus.loading()));

    switch (type) {
      case 2:
        final r = await _repository.getRefereeRoles();
        if (r.isError) {
          emit(state.copyWith(dynamicStatus: const RegisterStatus.error()));
          return;
        }
        emit(state.copyWith(
            dynamicStatus: const RegisterStatus.success(), refereeRoles: r.asValue!.value));
        break;
      case 3:
        final r = await _repository.getCoachSpecializations();
        if (r.isError) {
          emit(state.copyWith(dynamicStatus: const RegisterStatus.error()));
          return;
        }
        emit(state.copyWith(
            dynamicStatus: const RegisterStatus.success(), coachSpecs: r.asValue!.value));
        break;
      default:
        // Players have no single dynamic field — each selected activity carries
        // its own position, loaded per sport by [_loadPositions].
        emit(state.copyWith(dynamicStatus: const RegisterStatus.initial()));
    }
  }

  /// Fetches the positions of one sport. Cached results are reused, so
  /// re-selecting a sport is free.
  Future<void> _loadPositions(int sportId) async {
    if (state.positionsBySport.containsKey(sportId) ||
        state.loadingPositionSportIds.contains(sportId)) {
      return;
    }

    emit(state.copyWith(
      loadingPositionSportIds: [...state.loadingPositionSportIds, sportId],
    ));

    final result = await _repository.getPlayerPositions(sportId: sportId);

    // The sport may have been de-selected while the request was in flight.
    final stillSelected = state.sportIds.contains(sportId);
    emit(state.copyWith(
      loadingPositionSportIds:
          state.loadingPositionSportIds.where((id) => id != sportId).toList(),
      positionsBySport: result.isError || !stillSelected
          ? state.positionsBySport
          : {...state.positionsBySport, sportId: result.asValue!.value},
    ));

    // A sport with no positions can never carry `sport_position_id`, and the
    // endpoint rejects a `sport_id` without one — drop the selection instead of
    // leaving a chip the user cannot complete.
    if (!result.isError && result.asValue!.value.isEmpty && stillSelected) {
      _dropSport(sportId);
      MessageService.showToast(
        msg: LocaleKeys.registerSportNoPositions.tr(args: [_sportTitle(sportId)]),
        state: ToastStates.error,
      );
    }
  }

  String _sportTitle(int sportId) {
    for (final s in state.sports) {
      if (s.id == sportId) return s.title ?? '';
    }
    return '';
  }

  /// Removes a sport and the position bound to it — the two always travel
  /// together.
  void _dropSport(int sportId) {
    emit(state.copyWith(
      sportIds: state.sportIds.where((id) => id != sportId).toList(),
      sportPositionIds: {...state.sportPositionIds}..remove(sportId),
      sportError: null,
      sportPositionError: null,
    ));
  }

  // ─── Field updates ─────────────────────────────────────────────────────────
  void updateName(String value) => emit(state.copyWith(name: value, nameError: null));
  void updateBio(String value) => emit(state.copyWith(bio: value, bioError: null));
  void updateBirthDate(String value) =>
      emit(state.copyWith(birthDate: value, birthDateError: null));
  void selectCity(int value) => emit(state.copyWith(cityId: value, cityError: null));
  /// Sports are multi-select: tapping a selected chip removes it, along with
  /// the position that was picked for it.
  void toggleSport(int value) {
    if (state.sportIds.contains(value)) {
      _dropSport(value);
      return;
    }

    // Already known to offer no positions — re-tapping must not put it back.
    if (!state.hasDynamicField &&
        (state.positionsBySport[value]?.isEmpty ?? false)) {
      MessageService.showToast(
        msg: LocaleKeys.registerSportNoPositions.tr(args: [_sportTitle(value)]),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(
      sportIds: [...state.sportIds, value],
      sportError: null,
      sportPositionError: null,
    ));
    // Only players pick a position per sport.
    if (!state.hasDynamicField) _loadPositions(value);
  }

  /// One position per sport — assigning a new one replaces the previous pick.
  void selectSportPosition({required int sportId, required int positionId}) {
    // Ignore positions for a sport that is no longer selected (a stale
    // dropdown callback) — the pair must never outlive its sport.
    if (!state.sportIds.contains(sportId)) return;
    emit(state.copyWith(
      sportPositionIds: {...state.sportPositionIds, sportId: positionId},
      sportPositionError: null,
    ));
  }
  void selectDynamic(int value) =>
      emit(state.copyWith(dynamicId: value, dynamicError: null));

  void selectType(int value) {
    if (state.typeId == value) return;
    emit(state.copyWith(
      typeId: value,
      dynamicId: null,
      dynamicError: null,
      // Per-sport positions belong to players only — a referee/coach sends one
      // top-level position, so stale pairs must not ride along.
      sportPositionIds: const {},
      sportPositionError: null,
    ));
    loadDynamic();
    // Coming back to Player: the sports already picked now owe a position each.
    if (!state.hasDynamicField) {
      for (final sportId in [...state.sportIds]) {
        if (state.positionsBySport[sportId]?.isEmpty ?? false) {
          _dropSport(sportId);
        } else {
          _loadPositions(sportId);
        }
      }
    }
  }

  Future<void> pickAvatar() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image == null) return;

      // The picker's scaled file lives in the OS cache and can be evicted
      // before this form is submitted — keep our own copy.
      final durable = await PickedImageHelper.persist(image);
      emit(state.copyWith(avatarFile: durable, avatarError: null));
    } catch (_) {}
  }

  // ─── Validation ────────────────────────────────────────────────────────────
  bool validate() {
    String? nameError;
    String? bioError;
    String? avatarError;
    String? birthDateError;
    String? cityError;
    String? sportError;
    String? sportPositionError;
    String? dynamicError;
    bool isValid = true;

    if (state.avatarFile == null) {
      avatarError = LocaleKeys.registerAvatarError.tr();
      isValid = false;
    }
    if (state.name.trim().isEmpty) {
      nameError = LocaleKeys.registerNameError.tr();
      isValid = false;
    }
    if (state.bio.trim().isEmpty) {
      bioError = LocaleKeys.registerBioError.tr();
      isValid = false;
    }
    if (state.birthDate.isEmpty) {
      birthDateError = LocaleKeys.registerBirthDateError.tr();
      isValid = false;
    }
    if (state.cityId == null) {
      cityError = LocaleKeys.fieldIsRequired.tr();
      isValid = false;
    }
    if (state.sportIds.isEmpty) {
      sportError = LocaleKeys.fieldIsRequired.tr();
      isValid = false;
    }
    if (state.hasDynamicField && state.dynamicId == null) {
      dynamicError = LocaleKeys.fieldIsRequired.tr();
      isValid = false;
    }
    // Players owe a position for every activity they picked.
    if (!state.hasDynamicField && !state.allPositionsPicked) {
      sportPositionError = LocaleKeys.fieldIsRequired.tr();
      isValid = false;
    }

    emit(state.copyWith(
      nameError: nameError,
      bioError: bioError,
      avatarError: avatarError,
      birthDateError: birthDateError,
      cityError: cityError,
      sportError: sportError,
      sportPositionError: sportPositionError,
      dynamicError: dynamicError,
    ));
    return isValid;
  }

  // ─── Submit ────────────────────────────────────────────────────────────────
  Future<void> submit() async {
    if (!validate() || state.isSubmitting) return;

    // A pick made minutes ago may no longer be on disk; asking for it again
    // beats failing the whole request.
    if (!await PickedImageHelper.exists(state.avatarFile)) {
      emit(state.copyWith(
        avatarFile: null,
        avatarError: LocaleKeys.registerAvatarMissing.tr(),
      ));
      MessageService.showToast(
        msg: LocaleKeys.registerAvatarMissing.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    final result = await _repository.completeProfile(
      fields: {
        'full_name': state.name.trim(),
        'bio': state.bio.trim(),
        'birth_date': state.birthDate,
        'city_id': state.cityId,
        'type_id': state.typeId,
        ..._sportsFields(),
        if (state.hasDynamicField) 'sport_position_id': state.dynamicId,
      },
      avatar: state.avatarFile,
    );

    if (result.isError) {
      emit(state.copyWith(isSubmitting: false));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    _persistLocally(result.asValue!.value);

    // Emitted before navigating — the replaceAll below disposes this screen,
    // and with it the cubit.
    emit(state.copyWith(isSubmitting: false, isSuccess: true));
    MessageService.showToast(
      msg: LocaleKeys.registerSuccessTitle.tr(),
      state: ToastStates.success,
    );
    getIt<AppRouter>().replaceAll([HomeBottomTabsRoute(),PartnersRoute()],updateExistingRoutes: false);
  }

  /// Flattens the picked activities — each with its own position — into the
  /// nested array the endpoint expects (`sports[0][sport_id]`,
  /// `sports[0][sport_position_id]`, …). Kept in one place so the keys can be
  /// swapped if the contract changes.
  Map<String, dynamic> _sportsFields() {
    final fields = <String, dynamic>{};
    var i = 0;
    for (final sportId in state.sportIds) {
      final positionId = state.sportPositionIds[sportId];
      // Players owe a position per sport — a half-filled pair is rejected by the
      // endpoint, so the sport is dropped rather than sent alone. Referees and
      // coaches carry a single top-level position instead.
      if (positionId == null && !state.hasDynamicField) continue;
      fields['sports[$i][sport_id]'] = sportId;
      if (positionId != null) {
        fields['sports[$i][sport_position_id]'] = positionId;
      }
      i++;
    }
    return fields;
  }

  /// Caches the user the endpoint echoed back — profile, avatar and all — so
  /// every screen reading the cached user (participants banner, profile tab)
  /// sees the completed profile without a re-login.
  void _persistLocally(AppUser completed) {
    final preference = getIt<ILocalPreference>();
    final current = preference.appUser.value;

    preference.saveAppUser(
      completed.copyWith(
        // The response carries no tokens — carry the stored ones over or the
        // session is wiped on the next launch.
        token: current?.token,
        refreshToken: current?.refreshToken,
        haveTeam: current?.haveTeam,
        // Not part of the payload, but true by definition now.
        hasProfile: true,
      ),
    );

    // First time this user has a name and avatar — mirror them into Firestore so
    // they are not a blank entry in anyone's chat list. Not awaited; the service
    // logs its own failures.
    getIt<FirebaseUserSyncService>().syncCurrentUser();
  }
}
