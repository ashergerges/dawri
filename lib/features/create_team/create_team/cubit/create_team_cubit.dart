import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/create_team/data/repositories/interfaces/i_create_team_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'create_team_state.dart';
part 'create_team_cubit.freezed.dart';

class CreateTeamCubit extends Cubit<CreateTeamState> {
  CreateTeamCubit()
      : _repository = getIt<ICreateTeamRepository>(),
        super(const CreateTeamState());

  final ICreateTeamRepository _repository;
  final ImagePicker _picker = ImagePicker();

  // ─── Load dropdown options ──────────────────────────────────────────────────
  Future<void> init() async {
    emit(state.copyWith(isLoadingOptions: true));

    final citiesResult = await _repository.getCities();
    final sportsResult = await _repository.getSports();

    emit(state.copyWith(
      isLoadingOptions: false,
      cities: citiesResult.isError ? const [] : citiesResult.asValue!.value,
      sports: sportsResult.isError ? const [] : sportsResult.asValue!.value,
    ));
  }

  // ─── Field updates ───────────────────────────────────────────────────────────
  void updateTeamName(String value) =>
      emit(state.copyWith(teamName: value, teamNameError: null));

  void updateDescription(String value) => emit(state.copyWith(description: value));

  void selectSport(int id) => emit(state.copyWith(selectedSportId: id, sportError: null));

  void selectCity(int id) => emit(state.copyWith(selectedCityId: id, cityError: null));

  Future<void> pickImage() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image != null) emit(state.copyWith(logoFile: image));
    } catch (_) {
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
    }
  }

  // ─── Validation ────────────────────────────────────────────────────────────
  bool validate() {
    bool isValid = true;
    String? teamNameError;
    String? sportError;
    String? cityError;

    if (state.teamName.trim().isEmpty) {
      teamNameError = LocaleKeys.createTeamNameError.tr();
      isValid = false;
    }
    if (state.selectedSportId == null) {
      sportError = LocaleKeys.createTeamSportError.tr();
      isValid = false;
    }
    if (state.selectedCityId == null) {
      cityError = LocaleKeys.createTeamCityError.tr();
      isValid = false;
    }

    emit(state.copyWith(
      teamNameError: teamNameError,
      sportError: sportError,
      cityError: cityError,
    ));
    return isValid;
  }

  // ─── Submit ────────────────────────────────────────────────────────────────
  Future<void> submit() async {
    if (!validate() || state.isSubmitting) return;
    emit(state.copyWith(isSubmitting: true));

    final result = await _repository.createTeam(
      name: state.teamName.trim(),
      cityId: state.selectedCityId!,
      sportId: state.selectedSportId!,
      bio: state.description.trim(),
      logo: state.logoFile,
    );

    if (result.isError) {
      emit(state.copyWith(isSubmitting: false));
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    // Reflect the new team locally so other screens (participants,
    // manage_my_team) see haveTeam == true without a re-login.
    final localPreference = getIt<ILocalPreference>();
    final currentUser = localPreference.appUser.value;
    if (currentUser != null) {
      localPreference.saveAppUser(currentUser.copyWith(haveTeam: true));
    }

    MessageService.showToast(
      msg: LocaleKeys.createTeamSuccessMessage.tr(),
      state: ToastStates.success,
    );
    emit(state.copyWith(isSubmitting: false, isSuccess: true));
  }
}
