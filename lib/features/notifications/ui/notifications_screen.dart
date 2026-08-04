// lib/features/notifications/ui/notifications_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/notifications_cubit.dart';
import '../data/models/notifications_model.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationsCubit()..init(),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _SubHeader(),
          const _FilterChipsRow(),
          const Expanded(child: _NotificationsList()),
        ],
      ),
    );
  }
}

// ─── SUB HEADER ─────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  const _SubHeader();

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
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.slate100,
              child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.textDark),
            ),
          ),
          Row(
            children: [
              Text(
                LocaleKeys.notifTitle.tr(),
                style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
              ),
              BlocBuilder<NotificationsCubit, NotificationsState>(
                buildWhen: (p, c) => p.unreadCount != c.unreadCount,
                builder: (context, state) {
                  if (state.unreadCount == 0) return const SizedBox.shrink();
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w, left: 8.w),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                        child: Text(
                          '${state.unreadCount}',
                          style: AppTextTheme.bodyXXSmall(context)
                              .copyWith(fontWeight: FontWeight.w800, color: AppColors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          // Mark-all-as-read — disabled (grey/success) when nothing is unread.
          BlocBuilder<NotificationsCubit, NotificationsState>(
            buildWhen: (p, c) =>
                p.unreadCount != c.unreadCount || p.isMarkingAllRead != c.isMarkingAllRead,
            builder: (context, state) {
              return GestureDetector(
                onTap: () => context.read<NotificationsCubit>().markAllAsRead(),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.slate100,
                  child: state.isMarkingAllRead
                      ? SizedBox(
                    width: 14.sp,
                    height: 14.sp,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
                  )
                      : FaIcon(
                    FontAwesomeIcons.checkDouble,
                    size: 15.sp,
                    color: state.unreadCount == 0 ? AppColors.success : AppColors.textDark,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ─── FILTER CHIPS ────────────────────────────────────────────────────────────
class _FilterChipsRow extends StatelessWidget {
  const _FilterChipsRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      buildWhen: (p, c) =>
          p.types != c.types ||
          p.typesStatus != c.typesStatus ||
          p.selectedTypeId != c.selectedTypeId,
      builder: (context, state) {
        if (state.types.isEmpty && state.isLoadingTypes) {
          return SizedBox(
            height: 52.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 5.h),
              itemCount: 4,
              separatorBuilder: (_, __) => 10.w.sizedWidth,
              itemBuilder: (_, __) => ShimmerWidget.rectangular(width: 90.w, height: 32.h),
            ),
          );
        }

        // "All" (null id) followed by every type coming from the API.
        final chips = <({int? id, String label})>[
          (id: null, label: LocaleKeys.notifFilterAll.tr()),
          ...state.types.map((t) => (id: t.id, label: t.title ?? '')),
        ];

        return SizedBox(
          height: 52.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 5.h),
            itemCount: chips.length,
            separatorBuilder: (_, __) => 10.w.sizedWidth,
            itemBuilder: (context, index) {
              final chip = chips[index];
              final isActive = state.selectedTypeId == chip.id;
              return GestureDetector(
                onTap: () => context.read<NotificationsCubit>().selectType(chip.id),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: isActive ? AppColors.primary : AppColors.slate200),
                    boxShadow: isActive
                        ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))]
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    child: Center(
                      child: Text(
                        chip.label,
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: isActive ? AppColors.white : AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ─── NOTIFICATIONS LIST ──────────────────────────────────────────────────────
class _NotificationsList extends StatelessWidget {
  const _NotificationsList();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();

    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state.isFirstLoad) return const _ListShimmer();
        if (state.hasFailed) return _RetryState(onRetry: cubit.getNotifications);

        return SmartRefresher(
          controller: cubit.refreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () => cubit.getNotifications(),
          onLoading: () => cubit.loadMoreNotifications(),
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: state.notifications.isEmpty
              ? const _EmptyState()
              : ListView.separated(
                  padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 20.h),
                  itemCount: state.notifications.length,
                  separatorBuilder: (_, __) => 12.h.sizedHeight,
                  itemBuilder: (context, index) {
                    final notification = state.notifications[index];
                    return _NotificationCard(notification: notification);
                  },
                ),
        );
      },
    );
  }
}

// ─── NOTIFICATION CARD ───────────────────────────────────────────────────────
class _NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const _NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    final isUnread = notification.isUnread;
    final style = notificationStyleFor(notification.type);

    // Swipe-to-delete (no slidable package in the project — Dismissible does it).
    return Dismissible(
      key: ValueKey('notification_${notification.id}'),
      direction: DismissDirection.horizontal,
      confirmDismiss: (_) => _confirmDelete(context),
      onDismissed: (_) => cubit.deleteNotification(notification),
      background: _DeleteBackground(alignment: AlignmentDirectional.centerStart),
      secondaryBackground: _DeleteBackground(alignment: AlignmentDirectional.centerEnd),
      child: GestureDetector(
        onTap: () {
          // Already read → no request, only navigation.
          cubit.markAsRead(notification);
          // TODO: navigate based on notification type/target
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isUnread ? AppColors.slate50 : AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isUnread ? AppColors.primaryLight.withOpacity(0.3) : AppColors.slate200,
            ),
            boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Unread indicator bar (right side in RTL)
                  if (isUnread)
                    Container(width: 4.w, color: AppColors.primaryLight),
                  Expanded(
                    child: Padding(
                      padding: 16.w.padAll,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _NotifIconBox(icon: style.icon, color: style.color),
                          15.w.sizedWidth,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              notification.title ?? '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                                fontWeight: FontWeight.w900,
                                                color: AppColors.textDark,
                                              ),
                                            ),
                                          ),
                                          if (isUnread) ...[
                                            6.w.sizedWidth,
                                            Padding(
                                              padding: EdgeInsets.only(top: 2.h),
                                              child: DecoratedBox(
                                                decoration: const BoxDecoration(
                                                  color: AppColors.error,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: SizedBox(width: 7.w, height: 7.w),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                    8.w.sizedWidth,
                                    Text(
                                      notification.shortDate,
                                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textMuted,
                                      ),
                                    ),
                                  ],
                                ),
                                4.h.sizedHeight,
                                Text(
                                  notification.body ?? '',
                                  style: AppTextTheme.bodyXSmall(context).copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textMuted,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Text(
          LocaleKeys.notifDeleteConfirmTitle.tr(),
          style: AppTextTheme.bodyLargeSemiBold(dialogCtx).copyWith(fontWeight: FontWeight.w900),
        ),
        content: Text(
          LocaleKeys.notifDeleteConfirmDesc.tr(),
          style: AppTextTheme.bodySmall(dialogCtx).copyWith(color: AppColors.textMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, false),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, true),
            child: Text(LocaleKeys.delete.tr(), style: const TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }
}

class _DeleteBackground extends StatelessWidget {
  const _DeleteBackground({required this.alignment});

  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: FaIcon(FontAwesomeIcons.trashCan, size: 18.sp, color: AppColors.error),
        ),
      ),
    );
  }
}

class _NotifIconBox extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _NotifIconBox({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 48.w,
        height: 48.w,
        child: Center(child: FaIcon(icon, size: 19.sp, color: color)),
      ),
    );
  }
}

// ─── STATES ──────────────────────────────────────────────────────────────────
class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 20.h),
      itemCount: 6,
      separatorBuilder: (_, __) => 12.h.sizedHeight,
      itemBuilder: (_, __) => ShimmerWidget.rectangular(width: double.infinity, height: 95.h),
    );
  }
}

class _RetryState extends StatelessWidget {
  const _RetryState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.circleExclamation, size: 46.sp, color: AppColors.slate300),
          10.h.sizedHeight,
          Text(
            LocaleKeys.errorGeneric.tr(),
            style: AppTextTheme.bodyMedium(context)
                .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
          ),
          6.h.sizedHeight,
          TextButton(
            onPressed: onRetry,
            child: Text(
              LocaleKeys.tryAgain.tr(),
              style: AppTextTheme.bodySmallSemiBold(context)
                  .copyWith(fontWeight: FontWeight.w800, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── EMPTY STATE ─────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
          child: Column(
            children: [
              FaIcon(FontAwesomeIcons.bellSlash, size: 64.sp, color: AppColors.slate300),
              15.h.sizedHeight,
              Text(LocaleKeys.notifEmptyTitle.tr(), style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
              5.h.sizedHeight,
              Text(LocaleKeys.notifEmptyDesc.tr(), textAlign: TextAlign.center, style: AppTextTheme.bodySmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted)),
            ],
          ),
        ),
      ],
    );
  }
}
