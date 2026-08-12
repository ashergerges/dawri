// lib/features/partner_chat/cubit/partner_chat_cubit.dart
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/firebase/firebase_auth_service.dart';
import 'package:dawri/core/services/notification/notifications_service.dart';
import 'package:dawri/features/partner_chat/data/models/partner_chat_model.dart';
import 'package:dawri/features/partner_chat/data/repositories/interfaces/i_chat_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_chat_state.dart';
part 'partner_chat_cubit.freezed.dart';

class PartnerChatCubit extends Cubit<PartnerChatState> {
  PartnerChatCubit({
    required this.peerId,
    String? peerName,
    String? peerAvatar,
    String? peerPhone,
    IChatRepository? repository,
  })  : _repository = repository ?? getIt<IChatRepository>(),
        super(PartnerChatState(
          // Seeded from the screen that opened the chat so the header renders
          // immediately; the Firestore mirror overwrites these once it arrives,
          // which is what makes a peer's profile edit show up here.
          peerName: peerName ?? '',
          peerAvatar: peerAvatar ?? '',
          peerPhone: peerPhone,
        ));

  final String peerId;
  final IChatRepository _repository;

  StreamSubscription<List<ChatMessageModel>>? _messagesSub;
  StreamSubscription<ChatDocModel>? _chatSub;
  StreamSubscription<UserPresence>? _presenceSub;

  /// Stops the typing flag after a pause in keystrokes.
  Timer? _typingTimer;
  bool _isTypingPublished = false;

  late String _chatId;

  Future<void> init() async {
    final myId = getIt<ILocalPreference>().appUser.value?.id.toString();
    if (myId == null || myId.isEmpty || peerId.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        errorKey: LocaleKeys.partnerChatErrorNoSession,
      ));
      return;
    }

    // Firestore rules reject reads from an unauthenticated client, so the sign-in
    // has to land before the listeners attach.
    final auth = getIt<FirebaseAuthService>();
    await auth.ensureSignedIn();

    // Bail out rather than attaching listeners that are certain to be denied:
    // without a session every query fails with PERMISSION_DENIED, which reads as
    // a rules problem when the real cause is the failed sign-in logged above.
    if (!auth.isSignedIn) {
      emit(state.copyWith(
        isLoading: false,
        errorKey: LocaleKeys.partnerChatErrorLoadFailed,
      ));
      return;
    }

    _chatId = _repository.chatIdFor(myId, peerId);
    emit(state.copyWith(myId: myId));

    // Suppress push notifications for the conversation that's on screen.
    getIt<NotificationService>().activeChatPeerId = peerId;

    _messagesSub = _repository
        .watchMessages(chatId: _chatId, peerId: peerId)
        .listen(_onMessages, onError: _onStreamError);

    _chatSub = _repository
        .watchChat(chatId: _chatId, myId: myId, peerId: peerId)
        .listen(_onChat, onError: _onStreamError);

    _presenceSub = _repository
        .watchPeerPresence(peerId: peerId)
        .listen(_onPresence, onError: _onStreamError);
  }

  void _onMessages(List<ChatMessageModel> messages) {
    emit(state.copyWith(messages: messages, isLoading: false, errorKey: null));

    // The screen is open, so anything that just arrived has been seen.
    if (messages.any((m) => m.senderId != state.myId && !m.readBy.contains(state.myId))) {
      _repository.markRead(chatId: _chatId, myId: state.myId);
    }
  }

  void _onChat(ChatDocModel chat) {
    emit(state.copyWith(
      isPeerTyping: chat.isPeerTyping,
      // Only take the mirrored name/avatar when it is actually populated, so a
      // chat document that predates the mirror can't blank out the values the
      // opening screen passed in.
      peerName: chat.peerName.isNotEmpty ? chat.peerName : state.peerName,
      peerAvatar: chat.peerAvatar.isNotEmpty ? chat.peerAvatar : state.peerAvatar,
    ));
  }

  void _onPresence(UserPresence presence) {
    emit(state.copyWith(isPeerOnline: presence.isOnline));
  }

  void _onStreamError(Object error) {
    emit(state.copyWith(
      isLoading: false,
      errorKey: LocaleKeys.partnerChatErrorLoadFailed,
    ));
  }

  // ─── Sending ───────────────────────────────────────────────────────────────

  Future<void> sendTextMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || state.myId.isEmpty) return;

    _stopTyping();

    // No optimistic bubble needed: Firestore's local write shows up in the
    // snapshot right away with `hasPendingWrites`, which the model maps to
    // MessageStatus.sending.
    await _repository.sendMessage(
      chatId: _chatId,
      myId: state.myId,
      peerId: peerId,
      message: ChatMessageModel(
        id: '',
        senderId: state.myId,
        type: MessageType.text,
        text: trimmed,
      ),
    );
  }

  // ─── Typing ────────────────────────────────────────────────────────────────

  /// Called on each keystroke. Publishes the flag once, then lets the timer
  /// retract it, so a burst of typing is a single write rather than one per key.
  void onTextChanged(String text) {
    if (state.myId.isEmpty) return;

    if (text.trim().isEmpty) {
      _stopTyping();
      return;
    }

    if (!_isTypingPublished) {
      _isTypingPublished = true;
      _repository.setTyping(chatId: _chatId, myId: state.myId, isTyping: true);
    }

    _typingTimer?.cancel();
    _typingTimer = Timer(const Duration(seconds: 2), _stopTyping);
  }

  void _stopTyping() {
    _typingTimer?.cancel();
    if (!_isTypingPublished || state.myId.isEmpty) return;
    _isTypingPublished = false;
    _repository.setTyping(chatId: _chatId, myId: state.myId, isTyping: false);
  }

  @override
  Future<void> close() {
    // Leave the peer's typing indicator switched off, or it sticks until this
    // user types again.
    _stopTyping();

    // Guarded: another chat may already have claimed this while we were closing,
    // and clearing it unconditionally would re-enable notifications for it.
    final notifications = getIt<NotificationService>();
    if (notifications.activeChatPeerId == peerId) {
      notifications.activeChatPeerId = null;
    }

    _messagesSub?.cancel();
    _chatSub?.cancel();
    _presenceSub?.cancel();
    return super.close();
  }
}
