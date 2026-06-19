import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/common_widgets/custom_appbar.dart';
import 'package:dawri/core/utils/common_widgets/empty_widget.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/notification/cubit/notification_cubit.dart';
import 'package:dawri/features/notification/data/models/notification_item_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../gen/assets.gen.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..notifications(),
      child: Scaffold(
        appBar: CustomAppBar(title:LocaleKeys.notifications.tr()),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state.currState is Loading) {
              return const NotificationListWidgetShimmer();
            }

            final groups = state.notificationGroup
                .map(
                  (group) => NotificationGroup(
                    sectionTitle: group.dateName ?? '',
                    items: (group.notifications ?? [])
                        .map(
                          (notification) => NotificationItem(
                            title: notification.body ?? '',
                            time: notification.timeAgo ?? '',
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList();

            return NotificationListWidget(groups: groups);
          },
        ),
      ),
    );
  }
}

class NotificationGroup {
  final String sectionTitle; // "Today" / "Yesterday"
  final List<NotificationItem> items;

  const NotificationGroup({required this.sectionTitle, required this.items});
}

class NotificationListWidget extends StatelessWidget {
  final List<NotificationGroup> groups;

  const NotificationListWidget({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
  builder: (context, state) {
    return SmartRefresher(
      controller:state.refreshController ,
      onRefresh: () {
        context.read<NotificationCubit>().notifications(isRefresh: true);
        state.refreshController.refreshCompleted();
      },
      header: PullRefresh.pullRefresh,

      child:groups.isEmpty?EmptyWidget(
        text: "LocaleKeys.noNotifications.tr()",
        image:Assets.svg.error.svg() ,
      ): ListView.builder(
        shrinkWrap: true,
        padding: 16.padHorizontal + 12.padVertical,
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index != 0) 24.verticalSpace,
              _SectionHeader(title: group.sectionTitle),
              12.verticalSpace,
              // ── notification cards ─────────────
              ...group.items.map(
                (item) => Padding(
                  padding: 12.padBottom,
                  child: _NotificationCard(item: item),
                ),
              ),
            ],
          );
        },
      ),
    );
  },
);
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextTheme.bodyMedium(
            context,
          ).copyWith(color: AppColors.primary),
        ),
        10.horizontalSpace,
        Expanded(child: Container(height: 1, color: AppColors.primary100)),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const _NotificationCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 14.padHorizontal + 16.padVertical,
      margin: 5.padVertical,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral50,
            blurRadius: 30,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.h,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.secondary15,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.notifications_outlined,
                size: 24.h,
                color: AppColors.secondary30,
              ),
            ),
          ),
          14.horizontalSpace,
          Expanded(
            child: Text(item.title, style: AppTextTheme.bodyMedium(context)),
          ),

          // ── time (optional) ─────────────────
          if (item.time != null) ...[
            8.horizontalSpace,
            Text(item.time!, style: AppTextTheme.bodyXSmall(context)),
          ],
        ],
      ),
    );
  }
}

class NotificationListWidgetShimmer extends StatelessWidget {
  const NotificationListWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: 16.padHorizontal + 12.padVertical,
      itemCount: 2, // fake sections
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index != 0) 24.verticalSpace,

            // 🔥 Section Header
            Row(
              children: [
                ShimmerWidget.rectangular(width: 60.w, height: 14.h),

                10.horizontalSpace,

                Expanded(
                  child: Container(height: 1, color: AppColors.primary100),
                ),
              ],
            ),

            12.verticalSpace,

            // 🔥 Notification cards
            ...List.generate(3, (i) {
              return Padding(
                padding: 12.padBottom,
                child: Container(
                  padding: 14.padHorizontal + 16.padVertical,
                  margin: 5.padVertical,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutral50,
                        blurRadius: 30,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔥 Notification icon
                      ShimmerWidget.circular(width: 48.w, height: 48.w),

                      14.horizontalSpace,

                      // 🔥 Texts
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerWidget.rectangular(
                              width: double.infinity,
                              height: 12.h,
                            ),

                            8.verticalSpace,

                            ShimmerWidget.rectangular(
                              width: 180.w,
                              height: 12.h,
                            ),
                          ],
                        ),
                      ),

                      8.horizontalSpace,

                      // 🔥 Time
                      ShimmerWidget.rectangular(width: 40.w, height: 10.h),
                    ],
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
