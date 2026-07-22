// lib/features/create_championship/cubit/create_championship_cubit.dart
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/utils/app_time_format.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/create_championship/data/repositories/interfaces/i_create_championship_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'create_championship_state.dart';

part 'create_championship_cubit.freezed.dart';

class CreateChampionshipCubit extends Cubit<CreateChampionshipState> {
  CreateChampionshipCubit()
    : _repository = getIt<ICreateChampionshipRepository>(),
      super(const CreateChampionshipState());

  final ICreateChampionshipRepository _repository;
  final ImagePicker _picker = ImagePicker();

  // ─── Load Options ────────────────────────────────────────────────────────
  Future<void> loadFormOptions() async {
    emit(
      state.copyWith(
        optionsStatus: const CreateChampionshipStateStatus.loading(),
      ),
    );

    final sportsResult = await _repository.getSports();
    final typesResult = await _repository.getChampionshipTypes();
    final modesResult = await _repository.getRegistrationModes();
    final citiesResult = await _repository.getCities();

    if ([
      sportsResult,
      typesResult,
      modesResult,
      citiesResult,
    ].any((r) => r.isError)) {
      emit(
        state.copyWith(
          optionsStatus: const CreateChampionshipStateStatus.error(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        optionsStatus: const CreateChampionshipStateStatus.success(),
        sports: sportsResult.asValue?.value ?? [],
        championshipTypes: typesResult.asValue?.value ?? [],
        registrationModes: modesResult.asValue?.value ?? [],
        cities: citiesResult.asValue?.value ?? [],
      ),
    );
  }

  void selectCity(int id) => emit(state.copyWith(selectedCityId: id));

  // ─── Update Methods ──────────────────────────────────────────────────────
  void updateName(String value) => emit(state.copyWith(name: value));
  void updateAbout(String value) => emit(state.copyWith(about: value));
  void selectSport(int id) => emit(state.copyWith(selectedSportId: id));

  void selectChampionshipType(int id) =>
      emit(state.copyWith(selectedChampionshipTypeId: id));

  void selectRegistrationMode(int id) =>
      emit(state.copyWith(selectedRegistrationModeId: id));

  void updateTeams(String value) => emit(state.copyWith(teams: value));

  void updateFee(String value) => emit(state.copyWith(fee: value));

  void updateStartDate(String value) => emit(state.copyWith(startDate: value));

  void updateEndDate(String value) => emit(state.copyWith(endDate: value));

  void updatePrizeFirst(String value) =>
      emit(state.copyWith(prizeFirst: value));

  void updatePrizeSecond(String value) =>
      emit(state.copyWith(prizeSecond: value));

  // ─── Image Picker ────────────────────────────────────────────────────────
  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image != null) emit(state.copyWith(logoFile: image));
    } catch (e) {
      emit(
        state.copyWith(
          currState: const CreateChampionshipStateStatus.error(),
          errorMessage: LocaleKeys.failedToPickImage.tr() + "$e",
        ),
      );
    }
  }
  Future<void> pickCoverImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 600,
        imageQuality: 80,
      );
      if (image != null) emit(state.copyWith(coverImage: image));
    } catch (e) { emit(
      state.copyWith(
        currState: const CreateChampionshipStateStatus.error(),
        errorMessage: LocaleKeys.failedToPickImage.tr() + "$e",
      ),
    ); }
  }
  // ─── Launch Tournament ──────────────────────────────────────────────────
  Future<void> launchTournament() async {
    // ─── Validation ──────────────────────────────────────────────────────
    if (state.name.trim().isEmpty) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseEnterTournamentName.tr(),
        state: ToastStates.error,
      );
      return;
    }
    if (state.coverImage == null) {
      MessageService.showToast(msg: LocaleKeys.pleaseSelectCoverImage.tr(), state: ToastStates.error);
      return;
    }

    if (state.logoFile == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectTournamentImage.tr(),
        state: ToastStates.error,
      );
      return;
    }
    if (state.about.trim().isEmpty) {
      MessageService.showToast(msg: LocaleKeys.pleaseEnterAbout.tr(), state: ToastStates.error);
      return;
    }
    if (state.selectedSportId == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectSport.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.selectedChampionshipTypeId == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectChampionshipType.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.selectedRegistrationModeId == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectRegistrationMode.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.selectedCityId == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectCity.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.teams.trim().isEmpty || int.tryParse(state.teams) == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseEnterValidNumberOfTeams.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.fee.trim().isEmpty) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseEnterEntryFee.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.startDate.trim().isEmpty) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectStartDate.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.endDate.trim().isEmpty) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectEndDate.tr(),
        state: ToastStates.error,
      );
      return;
    }

    final start = AppTimeFormat.parseDateTime(state.startDate.trim());
    final end = AppTimeFormat.parseDateTime(state.endDate.trim());

    if (start.isAfter(end)) {
      MessageService.showToast(
        msg: LocaleKeys.startDateMustBeBeforeEndDate.tr(),
        state: ToastStates.error,
      );
      return;
    }
    // ─── Loading ─────────────────────────────────────────────────────────
    emit(state.copyWith(
      currState: const CreateChampionshipStateStatus.loading(),
      errorMessage: null,
    ));
    final logoMultipart = await MultipartFile.fromFile(state.logoFile!.path);
    final coverMultipart = await MultipartFile.fromFile(state.coverImage!.path);
    final result = await _repository.launchTournament(
      body: {
        'title': state.name,
        'sport_type_id': state.selectedSportId,
        'championship_type_id': state.selectedChampionshipTypeId,
        'registration_mode': state.selectedRegistrationModeId,
        'city_id': state.selectedCityId,
        'max_teams': int.tryParse(state.teams),
        'entry_fee': state.fee,
        'start_date': state.startDate,
        'end_date': state.endDate,
        'prize_money_for_first': state.prizeFirst,
        'prize_money_for_second': state.prizeSecond,
        'about': state.about,
        'cover_image': coverMultipart,
        "image": logoMultipart,
      },
    );

    if (result.isError) {
      emit(
        state.copyWith(
          currState: const CreateChampionshipStateStatus.error(),
          errorMessage: LocaleKeys.failedToCreateTournament.tr(),
          isSuccess: false,
        ),
      );
      MessageService.showToast(
        msg: result.asError?.error.toString()??"",
        state: ToastStates.error,
      );
      return;
    }

    emit(
      state.copyWith(
        currState: const CreateChampionshipStateStatus.success(),
        isSuccess: true,
        errorMessage: null,
      ),
    );
  }

  void reset() => emit(const CreateChampionshipState());
}
