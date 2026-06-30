// lib/features/notifications/ui/notifications_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/notifications_cubit.dart';
import '../data/models/notifications_model.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationsCubit(),
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
          Text(
            LocaleKeys.notifTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
          ),
          BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => context.read<NotificationsCubit>().markAllRead(),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.slate100,
                  child: state.isMarkingRead
                      ? SizedBox(
                    width: 14.sp,
                    height: 14.sp,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
                  )
                      : FaIcon(
                    FontAwesomeIcons.checkDouble,
                    size: 15.sp,
                    color: state.unreadIds.isEmpty ? AppColors.success : AppColors.textDark,
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
      builder: (context, state) {
        return SizedBox(
          height: 52.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 5.h),
            itemCount: NotificationsMockData.filterChips.length,
            separatorBuilder: (_, __) => 10.w.sizedWidth,
            itemBuilder: (context, index) {
              final chip = NotificationsMockData.filterChips[index];
              final isActive = state.selectedFilter == chip.filter;
              return GestureDetector(
                onTap: () => context.read<NotificationsCubit>().selectFilter(chip.filter),
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
                    child: Text(
                      chip.labelKey.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: isActive ? AppColors.white : AppColors.textMuted,
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
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final filtered = NotificationsMockData.notifications.where((n) {
          if (state.selectedFilter == NotifFilter.all) return true;
          return n.filterType == state.selectedFilter;
        }).toList();

        if (filtered.isEmpty) return const _EmptyState();

        return ListView.separated(
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 20.h),
          itemCount: filtered.length,
          separatorBuilder: (_, __) => 12.h.sizedHeight,
          itemBuilder: (context, index) {
            final n = filtered[index];
            return _NotificationCard(notification: n);
          },
        );
      },
    );
  }
}

// ─── NOTIFICATION CARD ───────────────────────────────────────────────────────
class _NotificationCard extends StatelessWidget {
  final NotificationData notification;
  const _NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final isUnread = state.unreadIds.contains(notification.id);
        final inviteStatus = state.inviteStatuses[notification.id];

        return GestureDetector(
          onTap: () => context.read<NotificationsCubit>().markRead(notification.id),
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
                            _NotifIconBox(iconType: notification.iconType),
                            15.w.sizedWidth,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        notification.titleKey.tr(),
                                        style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.textDark,
                                        ),
                                      ),
                                      Text(
                                        notification.timeKey.tr(),
                                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textMuted,
                                        ),
                                      ),
                                    ],
                                  ),
                                  4.h.sizedHeight,
                                  Text(
                                    notification.descKey.tr(),
                                    style: AppTextTheme.bodyXSmall(context).copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textMuted,
                                      height: 1.5,
                                    ),
                                  ),
                                  // Invite actions
                                  if (notification.hasInviteActions) ...[
                                    12.h.sizedHeight,
                                    if (inviteStatus == null)
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => context.read<NotificationsCubit>().rejectInvite(notification.id),
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: AppColors.slate100,
                                                  border: Border.all(color: AppColors.slate200),
                                                  borderRadius: BorderRadius.circular(10.r),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                                  child: Center(
                                                    child: Text(
                                                      LocaleKeys.notifInviteReject.tr(),
                                                      style: AppTextTheme.bodyXSmall(context).copyWith(
                                                        fontWeight: FontWeight.w800,
                                                        color: AppColors.error,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          10.w.sizedWidth,
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => context.read<NotificationsCubit>().acceptInvite(notification.id),
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: AppColors.primary,
                                                  borderRadius: BorderRadius.circular(10.r),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                                  child: Center(
                                                    child: Text(
                                                      LocaleKeys.notifInviteAccept.tr(),
                                                      style: AppTextTheme.bodyXSmall(context).copyWith(
                                                        fontWeight: FontWeight.w800,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    else
                                      Row(
                                        children: [
                                          FaIcon(
                                            inviteStatus == InviteStatus.accepted
                                                ? FontAwesomeIcons.circleCheck
                                                : FontAwesomeIcons.circleXmark,
                                            size: 14.sp,
                                            color: inviteStatus == InviteStatus.accepted ? AppColors.success : AppColors.textMuted,
                                          ),
                                          6.w.sizedWidth,
                                          Text(
                                            inviteStatus == InviteStatus.accepted
                                                ? LocaleKeys.notifInviteAccepted.tr()
                                                : LocaleKeys.notifInviteRejected.tr(),
                                            style: AppTextTheme.bodyXSmall(context).copyWith(
                                              fontWeight: FontWeight.w800,
                                              color: inviteStatus == InviteStatus.accepted ? AppColors.success : AppColors.textMuted,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
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
        );
      },
    );
  }
}

class _NotifIconBox extends StatelessWidget {
  final NotifIconType iconType;
  const _NotifIconBox({required this.iconType});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: iconType.color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 48.w,
        height: 48.w,
        child: Center(child: FaIcon(iconType.icon, size: 19.sp, color: iconType.color)),
      ),
    );
  }
}

// ─── EMPTY STATE ─────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}