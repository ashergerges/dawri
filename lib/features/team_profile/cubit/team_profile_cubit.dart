// lib/features/team_profile/cubit/team_profile_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
import 'package:dawri/features/team_profile/data/models/team_profile_model.dart';
import 'package:dawri/features/team_profile/data/repositories/interfaces/i_team_profile_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_profile_state.dart';
part 'team_profile_cubit.freezed.dart';

class TeamProfileCubit extends Cubit<TeamProfileState> {
  TeamProfileCubit(this.teamId)
      : _repository = getIt<ITeamProfileRepository>(),
        super(const TeamProfileState());

  final int teamId;
  final ITeamProfileRepository _repository;

  /// A user who already belongs to a team cannot join another one.
  bool get _haveTeam => getIt<ILocalPreference>().appUser.value?.haveTeam == true;

  // ─── Details ───────────────────────────────────────────────────────────────
  Future<void> loadDetails() async {
    emit(state.copyWith(status: const TeamProfileStatus.loading()));

    final result = await _repository.getTeamDetails(teamId: teamId);

    if (result.isError) {
      emit(state.copyWith(status: const TeamProfileStatus.error()));
      return;
    }

    emit(state.copyWith(
      status: const TeamProfileStatus.success(),
      team: result.asValue!.value,
      haveOtherTeam: _haveTeam,
    ));
  }

  // ─── Join request ──────────────────────────────────────────────────────────
  Future<void> joinTeam() async {
    final team = state.team;
    if (team == null || team.isJoined || state.isJoining || state.haveOtherTeam) {
      return;
    }

    emit(state.copyWith(isJoining: true));

    final result = await _repository.joinTeam(teamId: teamId);

    if (result.isError) {
      emit(state.copyWith(isJoining: false));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(
      isJoining: false,
      requestSent: true,
      team: team.copyWith(joinedTeam: true),
    ));

    final message = result.asValue!.value;
    MessageService.showToast(
      msg: message.isNotEmpty ? message : LocaleKeys.teamProfileRequestSent.tr(),
      state: ToastStates.success,
    );
  }

  // ─── Invitation link ───────────────────────────────────────────────────────
  Future<void> copyInviteLink() async {
    final link = state.team?.invitationLink ?? '';
    if (link.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: link));
    MessageService.showToast(
      msg: LocaleKeys.manageTeamLinkCopied.tr(),
      state: ToastStates.success,
    );
  }

  void shareWhatsApp() {
    final link = state.team?.invitationLink ?? '';
    if (link.isEmpty) return;

    UrlLauncher.shareToWhatsApp(
      '',
      message: '${LocaleKeys.manageTeamInviteShareText.tr()} $link',
    );
  }
}
