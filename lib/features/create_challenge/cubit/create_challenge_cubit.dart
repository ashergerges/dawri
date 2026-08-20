// lib/features/create_challenge/cubit/create_challenge_cubit.dart
import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:dawri/features/create_challenge/data/models/level_model.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart' hide SportModel;
import 'package:dawri/features/create_challenge/data/repositories/interfaces/i_challenge_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'create_challenge_state.dart';
part 'create_challenge_cubit.freezed.dart';

class CreateChallengeCubit extends Cubit<CreateChallengeState> {
  CreateChallengeCubit()
      : _repository = getIt<IChallengeRepository>(),
        super(const CreateChallengeState());

  final IChallengeRepository _repository;

  Future<void> init() async {
    emit(state.copyWith(
      date: DateTime.now(),
      time: TimeOfDay.now(),
      status: const CreateChallengeStatusLoading(),
    ));
    await _loadDropdownData();
  }

  Future<void> _loadDropdownData() async {
    final results = await Future.wait([
      _repository.getSports(),
      _repository.getCities(),
      _repository.getLevels(),
    ]);

    if (results.any((r) => r.isError)) {
      emit(state.copyWith(
        status: const CreateChallengeStatusError(),
        sports: [],
        cities: [],
        levels: [],
        stadiums: [],
      ));
      return;
    }

    final sports = (results[0] as Result<List<SportModel>>).asValue!.value;
    final cities = (results[1] as Result<List<CityModel>>).asValue!.value;
    final levels = (results[2] as Result<List<LevelModel>>).asValue!.value;

    final firstCityId = cities.isNotEmpty ? cities.first.id : null;

    emit(state.copyWith(
      status: const CreateChallengeStatusSuccess(),
      sports: sports,
      cities: cities,
      levels: levels,
      stadiums: [],
      selectedSportId: sports.isNotEmpty ? sports.first.id : null,
      selectedCityId: firstCityId,
      selectedLevelId: levels.isNotEmpty ? levels.first.id : null,
      selectedStadiumId: null,
    ));

    if (firstCityId != null) await loadStadiums(firstCityId);
  }

  /// Stadiums depend on the selected city: `api/app/stadiums?city_id=X&paginate=0`.
  Future<void> loadStadiums(int cityId) async {
    emit(state.copyWith(isLoadingStadiums: true));

    final result = await _repository.getStadiums(cityId: cityId);

    // Ignore a late response for a city the user already moved away from.
    if (state.selectedCityId != cityId) return;

    if (result.isError) {
      emit(state.copyWith(
        isLoadingStadiums: false,
        stadiums: [],
        selectedStadiumId: null,
      ));
      return;
    }

    final stadiums = result.asValue!.value;
    emit(state.copyWith(
      isLoadingStadiums: false,
      stadiums: stadiums,
      selectedStadiumId: stadiums.isNotEmpty ? stadiums.first.id : null,
    ));
  }

  // Setters
  void setSport(int id) => emit(state.copyWith(selectedSportId: id));

  void setCity(int id) {
    if (state.selectedCityId == id) return;
    emit(state.copyWith(
      selectedCityId: id,
      stadiums: [],
      selectedStadiumId: null,
    ));
    loadStadiums(id);
  }

  void setStadium(int id) => emit(state.copyWith(selectedStadiumId: id));
  void setLevel(int id) => emit(state.copyWith(selectedLevelId: id));
  void setPlayers(int players) => emit(state.copyWith(playersPerTeam: players.clamp(1, 22)));
  void setDescription(String desc) => emit(state.copyWith(description: desc));
  void setDate(DateTime date) => emit(state.copyWith(date: date));
  void setTime(TimeOfDay time) => emit(state.copyWith(time: time));

  bool get isValid {
    final state = this.state;
    return state.selectedSportId != null &&
        state.selectedCityId != null &&
        state.selectedStadiumId != null &&
        state.selectedLevelId != null &&
        state.playersPerTeam >= 1 &&
        state.playersPerTeam <= 22 &&
        state.date != null &&
        state.time != null;
  }

  Future<void> submitChallenge() async {
    if (!isValid) return;

    emit(state.copyWith(isSubmitting: true));

    final date = state.date!;
    final time = state.time!;
    final Map<String, dynamic> requestBody = {
      'sport_id': state.selectedSportId,
      'players_needed': state.playersPerTeam,
      'city_id': state.selectedCityId,
      'stadium_id': state.selectedStadiumId,
      'description': state.description,
      'level': state.selectedLevelId,
      'date': date.toIso8601String().split('T').first,
      'time': '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
    };

    final result = await _repository.createChallenge(requestBody);

    emit(state.copyWith(isSubmitting: false));

    if (result.isError) {
      // Optionally handle error via snackbar
      return;
    }

    emit(state.copyWith(showSuccessModal: true));
  }

  void closeModal() => emit(state.copyWith(showSuccessModal: false));
}