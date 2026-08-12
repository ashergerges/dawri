part of 'partner_chat_cubit.dart';

@freezed
abstract class PartnerChatState with _$PartnerChatState {
  const factory PartnerChatState({
    /// Messages from Firestore, oldest first. Includes the user's own
    /// unacknowledged writes (Firestore replays local pending writes into the
    /// snapshot), which is why sending needs no separate optimistic list.
    @Default([]) List<ChatMessageModel> messages,

    /// Current user's backend id, as a string. Empty until [PartnerChatCubit.init]
    /// resolves it; the UI uses it to decide which side a bubble belongs on.
    @Default('') String myId,
    @Default('') String peerName,
    @Default('') String peerAvatar,
    String? peerPhone,
    @Default(false) bool isPeerTyping,
    @Default(false) bool isPeerOnline,

    @Default(true) bool isLoading,

    /// Translation key for a fatal load error (no session, stream failure).
    String? errorKey,
  }) = _PartnerChatState;
}
