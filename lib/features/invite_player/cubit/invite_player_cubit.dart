// lib/features/invite_player/cubit/invite_player_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dawri/features/invite_player/data/models/invite_player_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_player_state.dart';
part 'invite_player_cubit.freezed.dart';

class InvitePlayerCubit extends Cubit<InvitePlayerState> {
  InvitePlayerCubit() : super(const InvitePlayerState());

  void selectFilter(PlayerFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
  }

  void updateSearchQuery(String value) {
    emit(state.copyWith(searchQuery: value));
  }

  Future<void> copyInviteLink() async {
    emit(state.copyWith(isLinkCopied: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLinkCopied: false));
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