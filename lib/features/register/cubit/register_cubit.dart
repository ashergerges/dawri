// lib/features/register/cubit/register_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
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
        final r = await _repository.getPlayerPositions();
        if (r.isError) {
          emit(state.copyWith(dynamicStatus: const RegisterStatus.error()));
          return;
        }
        emit(state.copyWith(
            dynamicStatus: const RegisterStatus.success(), positions: r.asValue!.value));
    }
  }

  // ─── Field updates ─────────────────────────────────────────────────────────
  void updateName(String value) => emit(state.copyWith(name: value, nameError: null));
  void updateBio(String value) => emit(state.copyWith(bio: value, bioError: null));
  void updateBirthDate(String value) =>
      emit(state.copyWith(birthDate: value, birthDateError: null));
  void selectCity(int value) => emit(state.copyWith(cityId: value, cityError: null));
  void selectSport(int value) => emit(state.copyWith(sportId: value, sportError: null));
  void selectDynamic(int value) =>
      emit(state.copyWith(dynamicId: value, dynamicError: null));

  void selectType(int value) {
    if (state.typeId == value) return;
    emit(state.copyWith(typeId: value, dynamicId: null, dynamicError: null));
    loadDynamic();
  }

  Future<void> pickAvatar() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image != null) emit(state.copyWith(avatarFile: image, avatarError: null));
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
    if (state.sportId == null) {
      sportError = LocaleKeys.fieldIsRequired.tr();
      isValid = false;
    }
    if (state.dynamicId == null) {
      dynamicError = LocaleKeys.fieldIsRequired.tr();
      isValid = false;
    }

    emit(state.copyWith(
      nameError: nameError,
      bioError: bioError,
      avatarError: avatarError,
      birthDateError: birthDateError,
      cityError: cityError,
      sportError: sportError,
      dynamicError: dynamicError,
    ));
    return isValid;
  }

  // ─── Submit ────────────────────────────────────────────────────────────────
  Future<void> submit() async {
    if (!validate() || state.isSubmitting) return;
    emit(state.copyWith(isSubmitting: true));

    final result = await _repository.completeProfile(
      fields: {
        'full_name': state.name.trim(),
        'bio': state.bio.trim(),
        'birth_date': state.birthDate,
        'city_id': state.cityId,
        'type_id': state.typeId,
        'sport_id': state.sportId,
        'sport_position_id': state.dynamicId,
      },
      avatar: state.avatarFile,
    );

    if (result.isError) {
      emit(state.copyWith(isSubmitting: false));
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    // Reflect the completed profile locally so other screens (participants
    // banner) see hasProfile == true without a re-login.
    final localPreference = getIt<ILocalPreference>();
    final currentUser = localPreference.appUser.value;
    if (currentUser != null) {
      localPreference.saveAppUser(currentUser.copyWith(hasProfile: true));
    }

    MessageService.showToast(
      msg: LocaleKeys.registerSuccessTitle.tr(),
      state: ToastStates.success,
    );
    getIt<AppRouter>().replaceAll([HomeBottomTabsRoute(),PartnersRoute()],updateExistingRoutes: false);
    emit(state.copyWith(isSubmitting: false, isSuccess: true));
  }
}
