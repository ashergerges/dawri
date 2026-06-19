// lib/features/championships/cubit/create_championship_cubit.dart
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dawri/core/utils/enums/sport_type.dart';
import 'package:dawri/core/utils/enums/tournament_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/main_common.dart';

part 'create_championship_state.dart';
part 'create_championship_cubit.freezed.dart';


class CreateChampionshipCubit extends Cubit<CreateChampionshipState> {
  CreateChampionshipCubit() : super(const CreateChampionshipState());

  final ImagePicker _picker = ImagePicker();

  // ─── Update Methods ──────────────────────────────────────────────────────

  void updateName(String value) {
    emit(state.copyWith(name: value));
  }

  void selectSport(SportType sport) {
    emit(state.copyWith(selectedSport: sport));
  }

  void selectSystem(TournamentSystem system) {
    emit(state.copyWith(selectedSystem: system));
  }

  void updateTeams(String value) {
    emit(state.copyWith(teams: value));
  }

  void updateFee(String value) {
    emit(state.copyWith(fee: value));
  }

  void updateStadium(String value) {
    emit(state.copyWith(stadium: value));
  }

  void updateStartDate(String value) {
    emit(state.copyWith(startDate: value));
  }

  void updateEndDate(String value) {
    emit(state.copyWith(endDate: value));
  }

  void updatePrizeFirst(String value) {
    emit(state.copyWith(prizeFirst: value));
  }

  void updatePrizeSecond(String value) {
    emit(state.copyWith(prizeSecond: value));
  }

  // ─── Image Picker ────────────────────────────────────────────────────────

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image != null) {
        emit(state.copyWith(logoFile: image));
      }
    } catch (e) {
      emit(state.copyWith(
        currState: const CreateChampionshipStateStatus.error(),
        errorMessage: 'Failed to pick image: $e',
      ));
    }
  }

  // ─── Launch Tournament ──────────────────────────────────────────────────

  Future<void> launchTournament() async {
    // ─── Validation ──────────────────────────────────────────────────────
    if (state.name.isEmpty) {
      emit(state.copyWith(
        currState: const CreateChampionshipStateStatus.error(),
        errorMessage: 'Please enter tournament name',
      ));
      return;
    }

    if (state.teams.isEmpty || int.tryParse(state.teams) == null) {
      emit(state.copyWith(
        currState: const CreateChampionshipStateStatus.error(),
        errorMessage: 'Please enter valid number of teams',
      ));
      return;
    }

    if (state.stadium.isEmpty) {
      emit(state.copyWith(
        currState: const CreateChampionshipStateStatus.error(),
        errorMessage: 'Please enter stadium location',
      ));
      return;
    }

    // ─── Loading ──────────────────────────────────────────────────────────
    emit(state.copyWith(
      currState: const CreateChampionshipStateStatus.loading(),
      errorMessage: null,
    ));

    try {
      // ─── Simulate API Call ──────────────────────────────────────────────
      await Future.delayed(const Duration(seconds: 1));

      // ─── Success ────────────────────────────────────────────────────────
      emit(state.copyWith(
        currState: const CreateChampionshipStateStatus.success(),
        isSuccess: true,
        errorMessage: null,
      ));

    } catch (e) {
      // ─── Error ──────────────────────────────────────────────────────────
      emit(state.copyWith(
        currState: const CreateChampionshipStateStatus.error(),
        errorMessage: 'Failed to create tournament: $e',
        isSuccess: false,
      ));
    }
  }

  // ─── Reset ──────────────────────────────────────────────────────────────

  void reset() {
    emit(const CreateChampionshipState());
  }
}