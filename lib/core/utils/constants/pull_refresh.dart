import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../gen/assets.gen.dart';

class PullRefresh {
  PullRefresh._();
  static Widget pullRefresh = CustomHeader(
    height: 120.h,
    builder: (context, mode) {
      return SizedBox(
        height: 120.h,
        child: Assets.animations.pullRefresh.lottie(
          repeat: true,
          height: 100.w,
          width: 100.w,
        ),
      );
    },
  );
  static Widget loadMoreRefresh = CustomFooter(
    builder: (BuildContext context, LoadStatus? mode) {
      Widget body;
      if (mode == LoadStatus.idle) {
        body = 0.verticalSpace;
      } else if (mode == LoadStatus.loading) {
        body = const CircularProgressIndicator();
      } else if (mode == LoadStatus.canLoading) {
        body = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(LocaleKeys.pullUpToLoadMore.tr()),
            5.horizontalSpace,
            Icon(Icons.upload, size: 25.h),
          ],
        );
      } else {
        body = Text(LocaleKeys.noMoreData.tr());
      }
      return SizedBox(
        height: 30.h,
        child: Center(child: body),
      );
    },
  );
}
