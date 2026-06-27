// lib/features/partner_chat/data/partner_chat_model.dart
enum MessageStatus { sent, delivered, read }

enum MessageType { text, image, file, contractAction }

class ChatMessageModel {
  final String id;
  final bool isSentByMe;
  final MessageType type;
  final String? text;
  final String? attachmentPath;   // local file path for image/file
  final String? attachmentName;   // original file name (for file type)
  final int? attachmentSizeBytes;
  final String timeLabel;
  final MessageStatus status;
  final String? contractTitleKey; // only for MessageType.contractAction

  const ChatMessageModel({
    required this.id,
    required this.isSentByMe,
    required this.type,
    this.text,
    this.attachmentPath,
    this.attachmentName,
    this.attachmentSizeBytes,
    required this.timeLabel,
    this.status = MessageStatus.sent,
    this.contractTitleKey,
  });
}

class PartnerChatMockData {
  static const partnerName = 'الكابتن خالد الشمري';
  static const partnerAvatarUrl = 'https://i.pravatar.cc/150?img=11';
  static const isPartnerOnline = true;

  static const initialMessages = [
    ChatMessageModel(
      id: 'm1',
      isSentByMe: false,
      type: MessageType.text,
      text: 'partnerChatMsg1',
      timeLabel: '10:30 ص',
    ),
    ChatMessageModel(
      id: 'm2',
      isSentByMe: true,
      type: MessageType.text,
      text: 'partnerChatMsg2',
      timeLabel: '10:32 ص',
      status: MessageStatus.read,
    ),
    ChatMessageModel(
      id: 'm3',
      isSentByMe: false,
      type: MessageType.text,
      text: 'partnerChatMsg3',
      timeLabel: '10:35 ص',
    ),
    ChatMessageModel(
      id: 'm4',
      isSentByMe: true,
      type: MessageType.text,
      text: 'partnerChatMsg4',
      timeLabel: '10:37 ص',
      status: MessageStatus.read,
    ),
    ChatMessageModel(
      id: 'm5',
      isSentByMe: false,
      type: MessageType.contractAction,
      text: 'partnerChatMsg5',
      contractTitleKey: 'partnerChatContractTitle',
      timeLabel: '10:40 ص',
    ),
  ];

  /// Max attachment size allowed, in bytes (10 MB).
  static const int maxAttachmentSizeBytes = 10 * 1024 * 1024;
}