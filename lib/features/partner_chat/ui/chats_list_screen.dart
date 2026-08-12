// lib/features/partner_chat/ui/chats_list_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/firebase/firebase_auth_service.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/features/partner_chat/data/models/partner_chat_model.dart';
import 'package:dawri/features/partner_chat/data/repositories/interfaces/i_chat_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// All of the user's conversations, newest activity first.
///
/// Reads only the `chats` collection: each document carries the peer's
/// denormalized name and avatar in `memberInfo`, kept current by
/// `FirebaseUserSyncService`. That's the whole point of the mirror — this list
/// renders with one query and no per-row lookup against `users/` or the API.
@RoutePage()
class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  /// Held in state rather than rebuilt in `build`: a fresh stream on every
  /// rebuild would tear down and re-establish the Firestore listener.
  late final Future<Stream<List<ChatSummaryModel>>?> _chats;

  @override
  void initState() {
    super.initState();
    _chats = _openStream();
  }

  /// Firestore rules reject unauthenticated reads, so sign-in has to complete
  /// before the query is issued.
  Future<Stream<List<ChatSummaryModel>>?> _openStream() async {
    final myId = getIt<ILocalPreference>().appUser.value?.id.toString();
    if (myId == null || myId.isEmpty) return null;

    await getIt<FirebaseAuthService>().ensureSignedIn();
    return getIt<IChatRepository>().watchMyChats(myId: myId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          LocaleKeys.chatsListTitle.tr(),
          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: FutureBuilder<Stream<List<ChatSummaryModel>>?>(
        future: _chats,
        builder: (context, futureSnap) {
          if (futureSnap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          final stream = futureSnap.data;
          if (stream == null) return _message(context, LocaleKeys.partnerChatErrorNoSession);

          return StreamBuilder<List<ChatSummaryModel>>(
            stream: stream,
            builder: (context, snap) {
              if (snap.hasError) {
                return _message(context, LocaleKeys.partnerChatErrorLoadFailed);
              }
              if (!snap.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final chats = snap.data!;
              if (chats.isEmpty) return _message(context, LocaleKeys.chatsListEmpty);

              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemCount: chats.length,
                separatorBuilder: (_, __) => Divider(height: 1, color: AppColors.slate200),
                itemBuilder: (context, index) => _ChatTile(chat: chats[index]),
              );
            },
          );
        },
      ),
    );
  }

  Widget _message(BuildContext context, String key) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            key.tr(),
            textAlign: TextAlign.center,
            style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
          ),
        ),
      );
}

class _ChatTile extends StatelessWidget {
  final ChatSummaryModel chat;
  const _ChatTile({required this.chat});

  /// Clock time for today, a short date once it's older — the usual chat-list
  /// convention, and it keeps the row narrow.
  String _timeLabel(BuildContext context) {
    final at = chat.lastMessageAt;
    if (at == null) return '';

    final now = DateTime.now();
    final isToday = at.year == now.year && at.month == now.month && at.day == now.day;
    final locale = context.locale.languageCode;
    return isToday ? DateFormat.jm(locale).format(at) : DateFormat.Md(locale).format(at);
  }

  @override
  Widget build(BuildContext context) {
    final hasUnread = chat.unreadCount > 0;

    return OnTap(
      onTap: () => PartnerChatRoute(
        peerId: chat.peerId,
        peerName: chat.peerName,
        peerAvatar: chat.peerAvatar,
      ).push(context),
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(26.r),
              child: CustomNetworkImage(
                imageUrl: chat.peerAvatar,
                width: 52.w,
                height: 52.w,
                fit: BoxFit.cover,
              ),
            ),
            12.w.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    chat.peerName,
                    style: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.h.verticalSpace,
                  Text(
                    chat.lastMessagePreview,
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w500,
                      color: hasUnread ? AppColors.textDark : AppColors.textMuted,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            8.w.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _timeLabel(context),
                  style: AppTextTheme.bodyXXSmall(context).copyWith(color: AppColors.textMuted),
                ),
                6.h.verticalSpace,
                if (hasUnread)
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: Center(
                        child: Text(
                          // Beyond 99 the badge stops being readable.
                          chat.unreadCount > 99 ? '99+' : '${chat.unreadCount}',
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  FaIcon(FontAwesomeIcons.chevronLeft, size: 12.sp, color: AppColors.slate300),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
