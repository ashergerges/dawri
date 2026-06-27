part of 'partner_chat_cubit.dart';

@freezed
abstract class PartnerChatState with _$PartnerChatState {
  const factory PartnerChatState({
    @Default(PartnerChatMockData.initialMessages) List<ChatMessageModel> messages,
    @Default('') String? attachmentError,
    @Default(false) bool isPickingAttachment,
  }) = _PartnerChatState;
}