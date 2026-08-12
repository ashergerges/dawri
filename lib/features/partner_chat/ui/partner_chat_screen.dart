// lib/features/partner_chat/ui/partner_chat_screen.dart
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

// Absolute `package:` imports rather than relative ones, matching the rest of
// this file. Relative imports resolve by filesystem path, which on Windows can
// land in a second analysis context when the project is opened under a
// different drive-letter case (`c:` vs `C:`) — the analyzer then reports the
// symbols below as undefined even though compilation succeeds.
import 'package:dawri/features/partner_chat/cubit/partner_chat_cubit.dart';
import 'package:dawri/features/partner_chat/data/models/partner_chat_model.dart';

@RoutePage()
class PartnerChatScreen extends StatelessWidget {
  /// Backend id of the person being chatted with. The chat document id is
  /// derived from this plus the current user's id, so no conversation id is
  /// needed to open a chat.
  final String peerId;

  /// Name/avatar/phone from the screen that opened this one. Only used to paint
  /// the header before Firestore responds — the mirrored values win once they
  /// arrive, which is how a peer's profile edit shows up here.
  final String? peerName;
  final String? peerAvatar;
  final String? peerPhone;

  const PartnerChatScreen({
    super.key,
    required this.peerId,
    this.peerName,
    this.peerAvatar,
    this.peerPhone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartnerChatCubit(
        peerId: peerId,
        peerName: peerName,
        peerAvatar: peerAvatar,
        peerPhone: peerPhone,
      )..init(),
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
            p.messages.length != c.messages.length ||
            p.isPeerTyping != c.isPeerTyping,
        listener: (context, state) {
          if (state.messages.isNotEmpty || state.isPeerTyping) {
            WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom(animated: true));
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

}

// ─── CHAT HEADER ─────────────────────────────────────────────────────────────
class _ChatHeader extends StatelessWidget {
  const _ChatHeader();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PartnerChatCubit>().state;
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
                        // Blank is fine — CustomNetworkImage falls back to its
                        // placeholder for an empty URL as well as a null one.
                        imageUrl: state.peerAvatar,
                        width: 45.w,
                        height: 45.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (state.isPeerOnline)
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
                        state.peerName,
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        state.isPeerTyping
                            ? LocaleKeys.partnerChatTyping.tr()
                            : state.isPeerOnline
                                ? LocaleKeys.partnerChatOnlineNow.tr()
                                : LocaleKeys.partnerChatOffline.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: state.isPeerTyping || state.isPeerOnline
                              ? AppColors.success
                              : AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Hidden rather than dialing a placeholder: the peer's number is only
          // known when the opening screen had it.
          if ((state.peerPhone ?? '').isNotEmpty)
            OnTap(
              onTap: () => UrlLauncher.makePhoneCall(state.peerPhone!),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: FaIcon(FontAwesomeIcons.phone, size: 18.sp, color: AppColors.textMuted),
              ),
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
      buildWhen: (p, c) =>
          p.messages != c.messages ||
          p.isLoading != c.isLoading ||
          p.errorKey != c.errorKey ||
          p.isPeerTyping != c.isPeerTyping ||
          p.myId != c.myId,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorKey != null) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Text(
                state.errorKey!.tr(),
                textAlign: TextAlign.center,
                style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
              ),
            ),
          );
        }

        final messages = state.messages;
        if (messages.isEmpty && !state.isPeerTyping) {
          return Center(
            child: Text(
              LocaleKeys.partnerChatEmpty.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
            ),
          );
        }

        final rows = _buildRows(messages, state.isPeerTyping);

        return ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          itemCount: rows.length,
          itemBuilder: (context, index) => rows[index],
        );
      },
    );
  }

  /// Flattens the message list into rows, inserting a date separator whenever
  /// the calendar day changes.
  ///
  /// Messages still awaiting their server timestamp have a null [createdAt];
  /// they're grouped under today, which is where they belong anyway.
  List<Widget> _buildRows(List<ChatMessageModel> messages, bool isPeerTyping) {
    final rows = <Widget>[];
    DateTime? previousDay;

    for (final message in messages) {
      final date = message.createdAt ?? DateTime.now();
      final day = DateTime(date.year, date.month, date.day);

      if (previousDay == null || day != previousDay) {
        rows.add(_DateSeparator(day: day));
        previousDay = day;
      }

      rows.add(Padding(
        key: ValueKey(message.id),
        padding: EdgeInsets.only(bottom: 15.h),
        child: _MessageBubble(message: message),
      ));
    }

    if (isPeerTyping) rows.add(const _TypingIndicator());
    return rows;
  }
}

class _DateSeparator extends StatelessWidget {
  final DateTime day;
  const _DateSeparator({required this.day});

  /// "Today"/"Yesterday" for the recent days people actually scan for, and a
  /// locale-aware date beyond that.
  String _label(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final difference = today.difference(day).inDays;

    if (difference == 0) return LocaleKeys.partnerChatToday.tr();
    if (difference == 1) return LocaleKeys.partnerChatYesterday.tr();
    return DateFormat.yMMMd(context.locale.languageCode).format(day);
  }

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
              _label(context),
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

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Text(
              LocaleKeys.partnerChatTyping.tr(),
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w600,
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

  /// Clock while the write is in flight, single check once stored, double check
  /// once the peer has read it.
  IconData get _statusIcon {
    switch (message.status) {
      case MessageStatus.sending:
        return FontAwesomeIcons.clock;
      case MessageStatus.sent:
        return FontAwesomeIcons.check;
      case MessageStatus.read:
        return FontAwesomeIcons.checkDouble;
    }
  }

  /// Locale-aware clock time. Blank until the server timestamp resolves, rather
  /// than showing a local guess that could disagree with the peer's view.
  String _timeLabel(BuildContext context) {
    final createdAt = message.createdAt;
    if (createdAt == null) return '';
    return DateFormat.jm(context.locale.languageCode).format(createdAt);
  }

  @override
  Widget build(BuildContext context) {
    final myId = context.read<PartnerChatCubit>().state.myId;
    final isMe = message.senderId == myId;

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
              _timeLabel(context),
              style: AppTextTheme.bodyXXSmall(context).copyWith(color: AppColors.textMuted),
            ),
            if (isMe) ...[
              4.w.sizedWidth,
              FaIcon(
                _statusIcon,
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
          text,
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
          child: Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.slate100,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TextFormField(
                        controller: _controller,
                        onChanged: context.read<PartnerChatCubit>().onTextChanged,
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
              ),
        ),
      ),
    );
  }
}