// lib/features/partner_chat/ui/partner_chat_screen.dart
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/partner_chat_cubit.dart';
import '../data/models/partner_chat_model.dart';

@RoutePage()
class PartnerChatScreen extends StatelessWidget {
  const PartnerChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartnerChatCubit(),
      child: const _PartnerChatView(),
    );
  }
}

class _PartnerChatView extends StatefulWidget {
  const _PartnerChatView();

  @override
  State<_PartnerChatView> createState() => _PartnerChatViewState();
}

class _PartnerChatViewState extends State<_PartnerChatView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom({bool animated = false}) {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position.maxScrollExtent;
    if (animated) {
      _scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    } else {
      _scrollController.jumpTo(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PartnerChatCubit, PartnerChatState>(
        listenWhen: (p, c) =>
        p.messages.length != c.messages.length || p.attachmentError != c.attachmentError,
        listener: (context, state) {
          if (state.messages.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom(animated: true));
          }
          if (state.attachmentError != null) {
            // _showAttachmentError(context, state.attachmentError!);
            context.read<PartnerChatCubit>().clearAttachmentError();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const _ChatHeader(),
              Expanded(
                child: _MessagesList(scrollController: _scrollController),
              ),
              const _ChatInputBar(),
            ],
          );
        },
      ),
    );
  }

  void _showAttachmentError(BuildContext context, String errorKey) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorKey.tr()),
        backgroundColor: AppColors.danger,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }
}

// ─── CHAT HEADER ─────────────────────────────────────────────────────────────
class _ChatHeader extends StatelessWidget {
  const _ChatHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: FaIcon(FontAwesomeIcons.arrowRight, size: 19.sp, color: AppColors.textDark),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(23.r),
                      child: CustomNetworkImage(
                        imageUrl: PartnerChatMockData.partnerAvatarUrl,
                        width: 45.w,
                        height: 45.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (PartnerChatMockData.isPartnerOnline)
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.success,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white, width: 2),
                          ),
                          child: SizedBox(width: 11.w, height: 11.w),
                        ),
                      ),
                  ],
                ),
                12.w.sizedWidth,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        PartnerChatMockData.partnerName,
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        PartnerChatMockData.isPartnerOnline
                            ? LocaleKeys.partnerChatOnlineNow.tr()
                            : '',
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          OnTap(
            onTap: () {
              UrlLauncher.makePhoneCall("201221167185");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: FaIcon(FontAwesomeIcons.phone, size: 18.sp, color: AppColors.textMuted),
            ),
          ),
          20.horizontalSpace,
          OnTap(
            onTap: () {},
            child: FaIcon(FontAwesomeIcons.ellipsisVertical, size: 18.sp, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}

// ─── MESSAGES LIST ──────────────────────────────────────────────────────────
class _MessagesList extends StatelessWidget {
  final ScrollController scrollController;
  const _MessagesList({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerChatCubit, PartnerChatState>(
      buildWhen: (p, c) => p.messages != c.messages,
      builder: (context, state) {
        return ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          itemCount: state.messages.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const _DateSeparator();
            }
            final message = state.messages[index - 1];
            return Padding(
              key: ValueKey(message.id),
              padding: EdgeInsets.only(bottom: 15.h),
              child: _MessageBubble(message: message),
            );
          },
        );
      },
    );
  }
}

class _DateSeparator extends StatelessWidget {
  const _DateSeparator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.slate200,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: Text(
              LocaleKeys.partnerChatToday.tr(),
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── MESSAGE BUBBLE ─────────────────────────────────────────────────────────
class _MessageBubble extends StatelessWidget {
  final ChatMessageModel message;
  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isSentByMe;
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 0.8.sw),
          child: _buildBubbleContent(context, isMe),
        ),
        6.h.sizedHeight,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.timeLabel,
              style: AppTextTheme.bodyXXSmall(context).copyWith(color: AppColors.textMuted),
            ),
            if (isMe) ...[
              4.w.sizedWidth,
              FaIcon(
                message.status == MessageStatus.read
                    ? FontAwesomeIcons.checkDouble
                    : FontAwesomeIcons.check,
                size: 11.sp,
                color: message.status == MessageStatus.read ? AppColors.success : AppColors.textMuted,
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildBubbleContent(BuildContext context, bool isMe) {
    switch (message.type) {
      case MessageType.text:
        return _TextBubble(text: message.text ?? '', isMe: isMe);
      case MessageType.image:
        return _ImageBubble(path: message.attachmentPath!);
      case MessageType.file:
        return _FileBubble(
          name: message.attachmentName ?? '',
          sizeBytes: message.attachmentSizeBytes ?? 0,
          isMe: isMe,
        );
      case MessageType.contractAction:
        return _ContractActionBubble(message: message);
    }
  }
}

class _TextBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  const _TextBubble({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isMe ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(isMe ? 4.r : 20.r),
          bottomRight: Radius.circular(isMe ? 20.r : 4.r),
        ),
        boxShadow: [
          BoxShadow(
            color: isMe ? AppColors.greenDark.withOpacity(0.2) : AppColors.black.withOpacity(0.02),
            blurRadius: isMe ? 10 : 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Text(
          text.startsWith('partnerChatMsg') ? text.tr() : text,
          style: AppTextTheme.bodySmall(context).copyWith(
            fontWeight: FontWeight.w500,
            color: isMe ? AppColors.white : AppColors.textDark,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String path;
  const _ImageBubble({required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFullScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.file(
          File(path),
          width: 200.w,
          height: 220.h,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            width: 200.w,
            height: 220.h,
            color: AppColors.slate100,
            child: Icon(Icons.broken_image, color: AppColors.slate300),
          ),
        ),
      ),
    );
  }

  void _openFullScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => _FullScreenImageViewer(path: path),
      ),
    );
  }
}

class _FullScreenImageViewer extends StatelessWidget {
  final String path;
  const _FullScreenImageViewer({required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: AppColors.black.withOpacity(0.92),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: Image.file(File(path), fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 15.w,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Icon(Icons.close, color: AppColors.white, size: 22.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FileBubble extends StatelessWidget {
  final String name;
  final int sizeBytes;
  final bool isMe;
  const _FileBubble({required this.name, required this.sizeBytes, required this.isMe});

  String get _sizeLabel {
    final kb = sizeBytes / 1024;
    if (kb < 1024) return '${kb.toStringAsFixed(0)} KB';
    return '${(kb / 1024).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isMe ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(isMe ? 4.r : 20.r),
          bottomRight: Radius.circular(isMe ? 20.r : 4.r),
        ),
        boxShadow: [
          BoxShadow(
            color: isMe ? AppColors.greenDark.withOpacity(0.2) : AppColors.black.withOpacity(0.02),
            blurRadius: isMe ? 10 : 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: isMe ? AppColors.white.withOpacity(0.15) : AppColors.background,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SizedBox(
                width: 38.w,
                height: 38.w,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.filePdf,
                    size: 16.sp,
                    color: isMe ? AppColors.white : AppColors.primaryLight,
                  ),
                ),
              ),
            ),
            10.w.sizedWidth,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: isMe ? AppColors.white : AppColors.textDark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  2.h.sizedHeight,
                  Text(
                    _sizeLabel,
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      color: isMe ? AppColors.white.withOpacity(0.7) : AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContractActionBubble extends StatelessWidget {
  final ChatMessageModel message;
  const _ContractActionBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TextBubble(text: message.text ?? '', isMe: false),
        8.h.sizedHeight,
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.primaryLight, width: 1.5),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: 12.w.padAll,
            child: Column(
              children: [
                Text(
                  '📄 ${message.contractTitleKey?.tr() ?? ''}',
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                10.h.sizedHeight,
                GestureDetector(
                  onTap: () {},
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Center(
                        child: Text(
                          LocaleKeys.partnerChatReviewAndAccept.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─── CHAT INPUT BAR ─────────────────────────────────────────────────────────
class _ChatInputBar extends StatefulWidget {
  const _ChatInputBar();

  @override
  State<_ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<_ChatInputBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend(BuildContext context) {
    context.read<PartnerChatCubit>().sendTextMessage(_controller.text);
    _controller.clear();
  }

  void _showAttachmentSheet(BuildContext context) {
    final cubit = context.read<PartnerChatCubit>();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const _AttachmentSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 12.h),
          child: BlocBuilder<PartnerChatCubit, PartnerChatState>(
            buildWhen: (p, c) => p.isPickingAttachment != c.isPickingAttachment,
            builder: (context, state) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: state.isPickingAttachment ? null : () => _showAttachmentSheet(context),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: AppColors.slate100, shape: BoxShape.circle),
                      child: SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: Center(
                          child: state.isPickingAttachment
                              ? SizedBox(
                            width: 16.w,
                            height: 16.w,
                            child: const CircularProgressIndicator(strokeWidth: 2),
                          )
                              : FaIcon(FontAwesomeIcons.plus, size: 16.sp, color: AppColors.textMuted),
                        ),
                      ),
                    ),
                  ),
                  10.w.sizedWidth,
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.slate100,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TextFormField(
                        controller: _controller,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        textInputAction: TextInputAction.send,
                        onFieldSubmitted: (_) => _handleSend(context),
                        decoration: InputDecoration(
                          hintText: LocaleKeys.partnerChatInputHint.tr(),
                          hintStyle: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textHint),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                        ),
                        style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textDark),
                      ),
                    ),
                  ),
                  10.w.sizedWidth,
                  OnTap(
                    onTap: () => _handleSend(context),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: 44.w,
                        height: 44.w,
                        child: Center(
                          child: FaIcon(FontAwesomeIcons.paperPlane, size: 17.sp, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ─── ATTACHMENT BOTTOM SHEET ─────────────────────────────────────────────────
class _AttachmentSheet extends StatelessWidget {
  const _AttachmentSheet();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PartnerChatCubit>();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.slate200,
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: SizedBox(width: 40.w, height: 4.h),
            ),
            20.h.sizedHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AttachmentOption(
                  icon: FontAwesomeIcons.camera,
                  color: AppColors.primary,
                  labelKey: LocaleKeys.partnerChatCamera,
                  onTap: () {
                    Navigator.pop(context);
                    cubit.pickImageFromCamera();
                  },
                ),
                _AttachmentOption(
                  icon: FontAwesomeIcons.image,
                  color: AppColors.blue500,
                  labelKey: LocaleKeys.partnerChatGallery,
                  onTap: () {
                    Navigator.pop(context);
                    cubit.pickImageFromGallery();
                  },
                ),
                _AttachmentOption(
                  icon: FontAwesomeIcons.filePdf,
                  color: AppColors.warning600,
                  labelKey: LocaleKeys.partnerChatDocument,
                  onTap: () {
                    Navigator.pop(context);
                    cubit.pickDocumentFile();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AttachmentOption extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String labelKey;
  final VoidCallback onTap;

  const _AttachmentOption({
    required this.icon,
    required this.color,
    required this.labelKey,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: SizedBox(
              width: 58.w,
              height: 58.w,
              child: Center(child: FaIcon(icon, size: 22.sp, color: color)),
            ),
          ),
          8.h.sizedHeight,
          Text(
            labelKey.tr(),
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}