part of 'invite_player_cubit.dart';

@freezed
abstract class InvitePlayerState with _$InvitePlayerState {
  const factory InvitePlayerState({
    @Default(PlayerFilter.all) PlayerFilter selectedFilter,
    @Default('') String searchQuery,
    @Default(false) bool isLinkCopied,
    @Default({}) Map<String, InviteStatus> inviteStatuses,
    @Default(false) bool isSuccessModalOpen,
  }) = _InvitePlayerState;
}