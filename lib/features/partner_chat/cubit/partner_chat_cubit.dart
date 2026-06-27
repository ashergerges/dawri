// lib/features/partner_chat/cubit/partner_chat_cubit.dart
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dawri/features/partner_chat/data/models/partner_chat_model.dart';

part 'partner_chat_state.dart';
part 'partner_chat_cubit.freezed.dart';

class PartnerChatCubit extends Cubit<PartnerChatState> {
  PartnerChatCubit() : super(const PartnerChatState());

  final ImagePicker _imagePicker = ImagePicker();
  int _idCounter = 1000;

  String get _now => 'الآن';

  void sendTextMessage(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    _appendMessage(
      ChatMessageModel(
        id: 'local-${_idCounter++}',
        isSentByMe: true,
        type: MessageType.text,
        text: trimmed,
        timeLabel: _now,
        status: MessageStatus.sent,
      ),
    );
  }

  /// Opens the gallery, validates size, and appends an image message.
  Future<void> pickImageFromGallery() => _pickImage(ImageSource.gallery);

  /// Opens the camera, validates size, and appends an image message.
  Future<void> pickImageFromCamera() => _pickImage(ImageSource.camera);

  Future<void> _pickImage(ImageSource source) async {
    emit(state.copyWith(isPickingAttachment: true, attachmentError: null));
    try {
      final picked = await _imagePicker.pickImage(
        source: source,
        imageQuality: 80, // pre-compress to keep payloads light
      );
      if (picked == null) {
        emit(state.copyWith(isPickingAttachment: false));
        return;
      }

      final file = File(picked.path);
      final sizeBytes = await file.length();

      if (sizeBytes > PartnerChatMockData.maxAttachmentSizeBytes) {
        emit(state.copyWith(
          isPickingAttachment: false,
          attachmentError: 'partnerChatErrorFileTooLarge',
        ));
        return;
      }

      _appendMessage(
        ChatMessageModel(
          id: 'local-${_idCounter++}',
          isSentByMe: true,
          type: MessageType.image,
          attachmentPath: picked.path,
          attachmentSizeBytes: sizeBytes,
          timeLabel: _now,
          status: MessageStatus.sent,
        ),
      );
      emit(state.copyWith(isPickingAttachment: false));
    } catch (_) {
      emit(state.copyWith(
        isPickingAttachment: false,
        attachmentError: 'partnerChatErrorPickFailed',
      ));
    }
  }

  /// Opens the device file browser, validates size, and appends a file message.
  Future<void> pickDocumentFile() async {
    emit(state.copyWith(isPickingAttachment: true, attachmentError: null));
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt'],
      );
      if (result == null || result.files.isEmpty) {
        emit(state.copyWith(isPickingAttachment: false));
        return;
      }

      final picked = result.files.single;
      final sizeBytes = picked.size;

      if (sizeBytes > PartnerChatMockData.maxAttachmentSizeBytes) {
        emit(state.copyWith(
          isPickingAttachment: false,
          attachmentError: 'partnerChatErrorFileTooLarge',
        ));
        return;
      }

      _appendMessage(
        ChatMessageModel(
          id: 'local-${_idCounter++}',
          isSentByMe: true,
          type: MessageType.file,
          attachmentPath: picked.path,
          attachmentName: picked.name,
          attachmentSizeBytes: sizeBytes,
          timeLabel: _now,
          status: MessageStatus.sent,
        ),
      );
      emit(state.copyWith(isPickingAttachment: false));
    } catch (_) {
      emit(state.copyWith(
        isPickingAttachment: false,
        attachmentError: 'partnerChatErrorPickFailed',
      ));
    }
  }

  void clearAttachmentError() {
    emit(state.copyWith(attachmentError: null));
  }

  void _appendMessage(ChatMessageModel message) {
    emit(state.copyWith(messages: [...state.messages, message]));
  }
}