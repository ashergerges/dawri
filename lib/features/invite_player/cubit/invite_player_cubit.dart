// lib/features/invite_player/cubit/invite_player_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
import 'package:dawri/features/invite_player/data/models/invite_player_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_player_state.dart';
part 'invite_player_cubit.freezed.dart';

class InvitePlayerCubit extends Cubit<InvitePlayerState> {
  InvitePlayerCubit({this.invitationLink}) : super(const InvitePlayerState());

  /// The team's invitation link (passed from the manage-team screen).
  final String? invitationLink;

  void selectFilter(PlayerFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
  }

  void updateSearchQuery(String value) {
    emit(state.copyWith(searchQuery: value));
  }

  void shareWhatsApp() {
    final link = invitationLink ?? '';
    if (link.isEmpty) return;
    UrlLauncher.shareToWhatsApp(
      '',
      message: '${LocaleKeys.manageTeamInviteShareText.tr()} $link',
    );
  }

  Future<void> copyInviteLink() async {
    final link = invitationLink ?? '';
    if (link.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: link));
    MessageService.showToast(
      msg: LocaleKeys.manageTeamLinkCopied.tr(),
      state: ToastStates.success,
    );

    emit(state.copyWith(isLinkCopied: true));
    await Future.delayed(const Duration(seconds: 2));
    if (!isClosed) emit(state.copyWith(isLinkCopied: false));
  }

  Future<void> sendInvite(String playerId) async {
    if (state.inviteStatuses[playerId] == InviteStatus.sent) return;

    final sendingStatuses = Map<String, InviteStatus>.from(state.inviteStatuses);
    sendingStatuses[playerId] = InviteStatus.sending;
    emit(state.copyWith(inviteStatuses: sendingStatuses));

    await Future.delayed(const Duration(milliseconds: 600));

    final sentStatuses = Map<String, InviteStatus>.from(state.inviteStatuses);
    sentStatuses[playerId] = InviteStatus.sent;
    emit(state.copyWith(inviteStatuses: sentStatuses, isSuccessModalOpen: true));
  }

  void closeSuccessModal() {
    emit(state.copyWith(isSuccessModalOpen: false));
  }
}