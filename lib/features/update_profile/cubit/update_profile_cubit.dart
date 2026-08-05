// lib/features/update_profile/cubit/update_profile_cubit.dart
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/common/data/local/models/app_user.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/register/data/repositories/interfaces/i_register_repository.dart';
import 'package:dawri/features/register/models/register_model.dart';
import 'package:dawri/features/update_profile/data/models/update_profile_model.dart';
import 'package:dawri/features/update_profile/data/repositories/interfaces/i_update_profile_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'update_profile_state.dart';
part 'update_profile_cubit.freezed.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit()
      : _repository = getIt<IUpdateProfileRepository>(),
        // Lookups (cities, positions, referee roles, coach specs) already live
        // on the register repository — reused rather than duplicated.
        _lookups = getIt<IRegisterRepository>(),
        super(const UpdateProfileState());

  final IUpdateProfileRepository _repository;
  final IRegisterRepository _lookups;
  final ImagePicker _imagePicker = ImagePicker();

  // ─── Load ──────────────────────────────────────────────────────────────────
  Future<void> init() async {
    emit(state.copyWith(loadStatus: const UpdateProfileStatus.loading()));

    final user = getIt<ILocalPreference>().appUser.value;
    final profile = user?.profile;

    // The cached user carries the whole profile, so the form is fully seeded
    // before any network call.
    emit(state.copyWith(
      name: profile?.fullName ?? '',
      email: profile?.email ?? '',
      phone: user?.phone ?? '',
      birthDate: profile?.birthDate ?? '',
      bio: profile?.bio ?? '',
      cityId: profile?.cityId,
      avatarPath: profile?.avatar ?? '',
      typeId: profile?.participantTypeId,
      sportId: profile?.sportId,
      dynamicId: profile?.sportPositionId,
    ));

    final citiesResult = await _lookups.getCities();
    if (citiesResult.isError) {
      emit(state.copyWith(loadStatus: const UpdateProfileStatus.error()));
      return;
    }
    emit(state.copyWith(cities: citiesResult.asValue!.value));

    // Caches written before `profile` carried sport/position fall back to the
    // participant record so the role dropdown still resolves.
    final userId = user?.id;
    if (state.sportId == null && userId != null) {
      final detailsResult = await _repository.getMyProfile(userId: userId);
      if (!detailsResult.isError) {
        final details = detailsResult.asValue!.value;
        emit(state.copyWith(
          bio: state.bio.isEmpty ? (details.bio ?? '') : state.bio,
          typeId: state.typeId ?? details.role?.id,
          sportId: details.sport?.id,
          dynamicId: state.dynamicId ?? details.position?.id,
        ));
      }
    }

    emit(state.copyWith(loadStatus: const UpdateProfileStatus.success()));
    await loadDynamic();
  }

  /// Loads the role list that matches the participant type — the same branch
  /// the register flow uses.
  Future<void> loadDynamic() async {
    final type = state.typeId;
    emit(state.copyWith(dynamicStatus: const UpdateProfileStatus.loading()));

    switch (type) {
      case UpdateProfileConstants.refereeTypeId:
        final r = await _lookups.getRefereeRoles();
        if (r.isError) {
          emit(state.copyWith(dynamicStatus: const UpdateProfileStatus.error()));
          return;
        }
        emit(state.copyWith(
          dynamicStatus: const UpdateProfileStatus.success(),
          refereeRoles: r.asValue!.value,
        ));
      case UpdateProfileConstants.coachTypeId:
        final r = await _lookups.getCoachSpecializations();
        if (r.isError) {
          emit(state.copyWith(dynamicStatus: const UpdateProfileStatus.error()));
          return;
        }
        emit(state.copyWith(
          dynamicStatus: const UpdateProfileStatus.success(),
          coachSpecs: r.asValue!.value,
        ));
      default:
        // Player positions are scoped to the user's sport.
        final sportId = state.sportId;
        if (sportId == null) {
          emit(state.copyWith(
            dynamicStatus: const UpdateProfileStatus.initial(),
            positions: const [],
          ));
          return;
        }
        final r = await _lookups.getPlayerPositions(sportId: sportId);
        if (r.isError) {
          emit(state.copyWith(dynamicStatus: const UpdateProfileStatus.error()));
          return;
        }
        emit(state.copyWith(
          dynamicStatus: const UpdateProfileStatus.success(),
          positions: r.asValue!.value,
        ));
    }
  }

  // ─── Field updates ─────────────────────────────────────────────────────────
  void updateName(String value) => emit(state.copyWith(name: value, nameError: null));

  void updateEmail(String value) => emit(state.copyWith(email: value, emailError: null));

  void updateBio(String value) => emit(state.copyWith(bio: value, bioError: null));

  void updateBirthDate(String value) =>
      emit(state.copyWith(birthDate: value, birthDateError: null));

  void selectCity(int value) => emit(state.copyWith(cityId: value, cityError: null));

  void selectDynamic(int value) =>
      emit(state.copyWith(dynamicId: value, dynamicError: null));

  // ─── Avatar ────────────────────────────────────────────────────────────────
  Future<void> pickAvatarFromGallery() async {
    emit(state.copyWith(isPickingAvatar: true, avatarError: null));
    try {
      final picked = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (picked == null) {
        emit(state.copyWith(isPickingAvatar: false));
        return;
      }

      final sizeBytes = await File(picked.path).length();
      if (sizeBytes > UpdateProfileConstants.maxAvatarSizeBytes) {
        emit(state.copyWith(
          isPickingAvatar: false,
          avatarError: LocaleKeys.updateProfileErrorImageTooLarge.tr(),
        ));
        return;
      }

      emit(state.copyWith(
        isPickingAvatar: false,
        avatarPath: picked.path,
        isLocalAvatar: true,
        avatarFile: picked,
      ));
    } catch (_) {
      emit(state.copyWith(
        isPickingAvatar: false,
        avatarError: LocaleKeys.updateProfileErrorPickFailed.tr(),
      ));
    }
  }

  void clearAvatarError() => emit(state.copyWith(avatarError: null));

  // ─── Validation ────────────────────────────────────────────────────────────
  bool validate() {
    String? nameError;
    String? emailError;
    String? birthDateError;
    String? cityError;
    String? dynamicError;
    String? bioError;
    bool isValid = true;

    if (state.name.trim().isEmpty) {
      nameError = LocaleKeys.registerNameError.tr();
      isValid = false;
    }
    // Email is optional, but must look like one when filled in.
    final email = state.email.trim();
    if (email.isNotEmpty && !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      emailError = LocaleKeys.validatorEmailInvalid.tr();
      isValid = false;
    }
    if (state.birthDate.isEmpty) {
      birthDateError = LocaleKeys.registerBirthDateError.tr();
      isValid = false;
    }
    if (state.safeCityId == null) {
      cityError = LocaleKeys.fieldIsRequired.tr();
      isValid = false;
    }
    if (state.bio.trim().isEmpty) {
      bioError = LocaleKeys.registerBioError.tr();
      isValid = false;
    }
    // Only demanded when there is actually a list to pick from.
    if (state.dynamicItems.isNotEmpty && state.safeDynamicId == null) {
      dynamicError = LocaleKeys.fieldIsRequired.tr();
      isValid = false;
    }

    emit(state.copyWith(
      nameError: nameError,
      emailError: emailError,
      birthDateError: birthDateError,
      cityError: cityError,
      dynamicError: dynamicError,
      bioError: bioError,
    ));
    return isValid;
  }

  // ─── Submit ────────────────────────────────────────────────────────────────
  Future<void> updateProfile() async {
    if (!validate() || state.isUpdating) return;
    emit(state.copyWith(isUpdating: true));

    final result = await _repository.updateProfile(
      fields: {
        'full_name': state.name.trim(),
        'email': state.email.trim(),
        'birth_date': state.birthDate,
        'city_id': state.safeCityId,
        if (state.safeDynamicId != null) 'sport_position_id': state.safeDynamicId,
        'bio': state.bio.trim(),
      },
      avatar: state.avatarFile,
    );

    if (result.isError) {
      emit(state.copyWith(isUpdating: false));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    _persistLocally(result.asValue!.value);
    emit(state.copyWith(isUpdating: false, isSuccess: true));
  }

  /// Stores the user the endpoint echoed back, so every screen reading the
  /// cached profile picks up the edit without a re-login.
  void _persistLocally(AppUser updated) {
    final preference = getIt<ILocalPreference>();
    final current = preference.appUser.value;

    // The response has no tokens — carry the stored ones over or the session
    // is wiped on the next launch.
    preference.saveAppUser(
      updated.copyWith(
        token: current?.token,
        refreshToken: current?.refreshToken,
        hasProfile: current?.hasProfile,
        haveTeam: current?.haveTeam,
      ),
    );

    final profile = updated.profile;
    if (profile == null) return;

    // Re-seed the form from the server's version of the record.
    emit(state.copyWith(
      name: profile.fullName ?? state.name,
      email: profile.email ?? '',
      bio: profile.bio ?? state.bio,
      birthDate: profile.birthDate ?? state.birthDate,
      cityId: profile.cityId ?? state.cityId,
      sportId: profile.sportId ?? state.sportId,
      dynamicId: profile.sportPositionId ?? state.dynamicId,
      avatarPath: profile.avatar ?? state.avatarPath,
      isLocalAvatar: false,
      avatarFile: null,
    ));
  }

  void dismissSuccess() => emit(state.copyWith(isSuccess: false));
}
