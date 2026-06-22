// lib/features/championship_add_team/cubit/championship_add_team_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/championship_add_team/data/models/championship_add_team_model.dart';

part 'championship_add_team_state.dart';
part 'championship_add_team_cubit.freezed.dart';

class ChampionshipAddTeamCubit extends Cubit<ChampionshipAddTeamState> {
  ChampionshipAddTeamCubit() : super(const ChampionshipAddTeamState());

  bool get isAllSelected =>
      state.selectedPlayerIndexes.length == ChampionshipAddTeamMockData.players.length;

  bool get meetsMinimum =>
      state.selectedPlayerIndexes.length >= ChampionshipAddTeamMockData.minPlayersRequired;

  void togglePlayer(int index) {
    final updated = Set<int>.from(state.selectedPlayerIndexes);
    if (updated.contains(index)) {
      updated.remove(index);
    } else {
      updated.add(index);
    }
    emit(state.copyWith(selectedPlayerIndexes: updated));
  }

  void toggleSelectAll() {
    if (isAllSelected) {
      emit(state.copyWith(selectedPlayerIndexes: {}));
    } else {
      emit(state.copyWith(
        selectedPlayerIndexes:
        Set<int>.from(List.generate(ChampionshipAddTeamMockData.players.length, (i) => i)),
      ));
    }
  }

  Future<void> confirmAndPay() async {
    if (!meetsMinimum) return;
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}