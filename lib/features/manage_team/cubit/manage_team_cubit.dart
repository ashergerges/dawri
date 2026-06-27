// lib/features/manage_team/cubit/manage_team_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/manage_team/data/models/manage_team_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_team_state.dart';
part 'manage_team_cubit.freezed.dart';

class ManageTeamCubit extends Cubit<ManageTeamState> {
  ManageTeamCubit()
      : super(ManageTeamState(
    roster: List.of(ManageTeamMockData.roster),
    pendingRequests: List.of(ManageTeamMockData.pendingRequests),
  ));

  void selectTab(ManageTeamTab tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  void acceptRequest(String requestId) {
    final request = state.pendingRequests.firstWhere((r) => r.id == requestId);
    final newPlayer = PlayerCardData(
      id: request.id,
      imageUrl: request.imageUrl,
      nameKey: request.nameKey,
      roleKey: request.roleKey,
    );
    emit(state.copyWith(
      roster: [...state.roster, newPlayer],
      pendingRequests: state.pendingRequests.where((r) => r.id != requestId).toList(),
    ));
  }

  void rejectRequest(String requestId) {
    emit(state.copyWith(
      pendingRequests: state.pendingRequests.where((r) => r.id != requestId).toList(),
    ));
  }

  void removePlayer(String playerId) {
    emit(state.copyWith(
      roster: state.roster.where((p) => p.id != playerId).toList(),
    ));
  }
}