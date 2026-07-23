// lib/features/championship_control/cubit/championship_control_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:dawri/features/championship_control/data/repositories/interfaces/i_championship_control_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'championship_control_state.dart';
part 'championship_control_cubit.freezed.dart';

class ChampionshipControlCubit extends Cubit<ChampionshipControlState> {
  ChampionshipControlCubit(this.championshipId)
      : _repository = getIt<IChampionshipControlRepository>(),
        super(const ChampionshipControlState());

  final int championshipId;
  final IChampionshipControlRepository _repository;

  // ─── Load ────────────────────────────────────────────────────────────────
  // Loaded sequentially (not in parallel): three simultaneous cold-start
  // requests race on the auth token in the interceptor, and only the first
  // one reliably goes out. One-at-a-time keeps every request firing.
  Future<void> init() async {
    await loadOverview();
    await loadMatches();
    await loadTeams();
  }

  /// Called when a tab becomes active — (re)loads its data if it isn't already
  /// loaded or loading, so tapping a tab always triggers its endpoint.
  void ensureTabLoaded(int index) {
    switch (index) {
      case 1:
        if (state.matchesStatus is! ControlStatusSuccess &&
            state.matchesStatus is! ControlStatusLoading) {
          loadMatches();
        }
        break;
      case 2:
        if (state.teamsStatus is! ControlStatusSuccess &&
            state.teamsStatus is! ControlStatusLoading) {
          loadTeams();
        }
        break;
    }
  }

  /// Make sure the approved teams are available (for the add-match dropdown).
  Future<void> ensureTeamsLoaded() async {
    if (state.teamsStatus is ControlStatusSuccess ||
        state.teamsStatus is ControlStatusLoading) {
      return;
    }
    await loadTeams();
  }

  Future<void> loadOverview({bool silent = false}) async {
    if (!silent) emit(state.copyWith(overviewStatus: const ControlStatus.loading()));

    final result = await _repository.getOverview(championshipId);
    if (result.isError) {
      if (!silent) emit(state.copyWith(overviewStatus: const ControlStatus.error()));
      return;
    }

    final overview = result.asValue!.value;
    emit(state.copyWith(
      overviewStatus: const ControlStatus.success(),
      overview: overview,
      pendingRequests: overview.pendingRequests ?? const [],
    ));
  }

  Future<void> loadTeams({bool silent = false}) async {
    if (!silent) emit(state.copyWith(teamsStatus: const ControlStatus.loading()));

    final result = await _repository.getApprovedTeams(championshipId);
    if (result.isError) {
      if (!silent) emit(state.copyWith(teamsStatus: const ControlStatus.error()));
      return;
    }

    emit(state.copyWith(
      teamsStatus: const ControlStatus.success(),
      approvedTeams: result.asValue!.value,
    ));
  }

  Future<void> loadMatches({bool silent = false}) async {
    if (!silent) emit(state.copyWith(matchesStatus: const ControlStatus.loading()));

    final result = await _repository.getMatches(championshipId);
    if (result.isError) {
      if (!silent) emit(state.copyWith(matchesStatus: const ControlStatus.error()));
      return;
    }

    emit(state.copyWith(
      matchesStatus: const ControlStatus.success(),
      matchGroups: result.asValue!.value,
    ));
  }

  // ─── Tabs ──────────────────────────────────────────────────────────────────
  void selectTab(int index) {
    if (state.activeTab != index) emit(state.copyWith(activeTab: index));
    ensureTabLoaded(index);
  }

  // ─── Requests (accept = 1, reject = 2) ──────────────────────────────────────
  Future<void> acceptRequest(int requestId) => _updateRequest(requestId, status: 1);
  Future<void> rejectRequest(int requestId) => _updateRequest(requestId, status: 2);

  Future<void> _updateRequest(int requestId, {required int status}) async {
    final request =
        state.pendingRequests.where((r) => r.id == requestId).firstOrNull;

    final result = await _repository.updateRequestStatus(
      championshipId: championshipId,
      requestId: requestId,
      status: status,
    );

    if (result.isError) {
      MessageService.showToast(
        msg: LocaleKeys.championshipControlActionFailed.tr(),
        state: ToastStates.error,
      );
      return;
    }

    // Optimistically drop the request from the pending list.
    emit(state.copyWith(
      pendingRequests:
          state.pendingRequests.where((r) => r.id != requestId).toList(),
    ));

    MessageService.showToast(
      msg: (status == 1
              ? LocaleKeys.championshipControlRequestAccepted
              : LocaleKeys.championshipControlRequestRejected)
          .tr(args: [request?.name ?? '']),
      state: ToastStates.success,
    );

    // Accepting a team affects counts + the approved list.
    loadOverview(silent: true);
    if (status == 1) loadTeams(silent: true);
  }

  // ─── Approved teams ─────────────────────────────────────────────────────────
  Future<void> removeApprovedTeam(ApprovedTeamModel team) async {
    if (team.id == null) return;

    final result = await _repository.deleteParticipation(
      championshipId: championshipId,
      participationId: team.id!,
    );

    if (result.isError) {
      MessageService.showToast(
        msg: LocaleKeys.championshipControlActionFailed.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(
      approvedTeams:
          state.approvedTeams.where((t) => t.id != team.id).toList(),
    ));

    MessageService.showToast(
      msg: LocaleKeys.championshipControlTeamRemoved.tr(args: [team.name ?? '']),
      state: ToastStates.success,
    );

    loadOverview(silent: true);
  }

  // ─── Matches ──────────────────────────────────────────────────────────────
  Future<bool> addMatch({
    required int homeId,
    required int awayId,
    required String matchDate,
  }) async {
    emit(state.copyWith(isSubmitting: true));

    final result = await _repository.addMatch(
      championshipId: championshipId,
      homeId: homeId,
      awayId: awayId,
      matchDate: matchDate,
    );

    emit(state.copyWith(isSubmitting: false));

    if (result.isError) {
      MessageService.showToast(
        msg: LocaleKeys.championshipControlActionFailed.tr(),
        state: ToastStates.error,
      );
      return false;
    }

    MessageService.showToast(
      msg: LocaleKeys.championshipControlMatchAdded.tr(),
      state: ToastStates.success,
    );

    loadMatches(silent: true);
    loadOverview(silent: true);
    return true;
  }

  Future<bool> updateMatchResult({
    required int matchId,
    required int homeScore,
    required int awayScore,
  }) async {
    emit(state.copyWith(isSubmitting: true));

    final result = await _repository.updateMatchResult(
      championshipId: championshipId,
      matchId: matchId,
      homeScore: homeScore,
      awayScore: awayScore,
    );

    emit(state.copyWith(isSubmitting: false));

    if (result.isError) {
      MessageService.showToast(
        msg: LocaleKeys.championshipControlActionFailed.tr(),
        state: ToastStates.error,
      );
      return false;
    }

    MessageService.showToast(
      msg: LocaleKeys.championshipControlScoreUpdated.tr(),
      state: ToastStates.success,
    );

    loadMatches(silent: true);
    loadOverview(silent: true);
    return true;
  }

  // ─── Header stats (from overview) ───────────────────────────────────────────
  int get totalTeams => state.overview?.teamsCount ?? 0;
  int get matchesPlayed => state.overview?.matchesPlayed ?? 0;
  int get matchesRemaining => state.overview?.matchesRemaining ?? 0;
}
