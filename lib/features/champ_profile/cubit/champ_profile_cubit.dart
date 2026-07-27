// lib/features/champ_profile/cubit/champ_profile_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/champ_profile/data/models/champ_profile_model.dart';
import 'package:dawri/features/champ_profile/data/repositories/interfaces/i_champ_profile_repository.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'champ_profile_state.dart';
part 'champ_profile_cubit.freezed.dart';

class ChampProfileCubit extends Cubit<ChampProfileState> {
  ChampProfileCubit(this.championshipId)
      : _repository = getIt<IChampProfileRepository>(),
        super(const ChampProfileState());

  final int championshipId;
  final IChampProfileRepository _repository;

  Future<void> init() => loadDetails();

  // ─── Details ─────────────────────────────────────────────────────────────
  Future<void> loadDetails() async {
    emit(state.copyWith(detailsStatus: const ChampProfileStatus.loading()));

    final result = await _repository.getChampionshipDetails(championshipId);
    if (result.isError) {
      emit(state.copyWith(detailsStatus: const ChampProfileStatus.error()));
      return;
    }

    final details = result.asValue!.value;
    emit(state.copyWith(
      detailsStatus: const ChampProfileStatus.success(),
      details: details,
      isFavorite: details.isFavorite ?? false,
    ));
  }

  // ─── Tabs (lazy) ───────────────────────────────────────────────────────────
  void selectTab(ChampTab tab) {
    if (state.selectedTab != tab) emit(state.copyWith(selectedTab: tab));

    if (tab == ChampTab.teams && state.teamsStatus is ChampProfileStatusInitial) {
      loadTeams();
    } else if (tab == ChampTab.matches &&
        state.matchesStatus is ChampProfileStatusInitial) {
      loadMatches();
    }
  }

  Future<void> loadTeams() async {
    emit(state.copyWith(teamsStatus: const ChampProfileStatus.loading()));

    final result = await _repository.getApprovedTeams(championshipId);
    if (result.isError) {
      emit(state.copyWith(teamsStatus: const ChampProfileStatus.error()));
      return;
    }

    emit(state.copyWith(
      teamsStatus: const ChampProfileStatus.success(),
      teams: result.asValue!.value,
    ));
  }

  Future<void> loadMatches() async {
    emit(state.copyWith(matchesStatus: const ChampProfileStatus.loading()));

    final result = await _repository.getMatches(championshipId);
    if (result.isError) {
      emit(state.copyWith(matchesStatus: const ChampProfileStatus.error()));
      return;
    }

    emit(state.copyWith(
      matchesStatus: const ChampProfileStatus.success(),
      matchGroups: result.asValue!.value,
    ));
  }

  // ─── Wishlist (optimistic) ──────────────────────────────────────────────────
  Future<void> toggleWishlist() async {
    final previous = state.isFavorite;
    // Flip immediately for a responsive UI.
    emit(state.copyWith(isFavorite: !previous));

    final result = await _repository.toggleWishlist(championshipId: championshipId);

    if (result.isError) {
      // Revert on failure.
      emit(state.copyWith(isFavorite: previous));
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    MessageService.showToast(
      msg: result.asValue!.value,
      state: ToastStates.success,
    );
  }
}
