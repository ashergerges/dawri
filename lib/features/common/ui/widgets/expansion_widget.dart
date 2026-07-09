import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';


class ExpansionWidget extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsets? childrenPadding;

  const ExpansionWidget({
    super.key,
    required this.title,
    required this.children, this.childrenPadding,
  });

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: 0.padAll,
        title: Text(
          widget.title,
          style: AppTextTheme.bodyMediumMediumWeight(context),
        ),
        trailing: _isExpanded
            ? Icon(Icons.arrow_upward)
            : Icon(Icons.arrow_downward),
        onExpansionChanged: (expanded) {
          setState(() => _isExpanded = expanded);
        },
        childrenPadding: widget.childrenPadding?? 16.padHorizontal + 16.padBottom,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }
}

class ExpansionWidgetShimmer extends StatelessWidget {
  const ExpansionWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.padVertical,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            height: 10.h,
            width: 250,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
          0.verticalSpace,
          ShimmerWidget.rectangular(
            height: 10.h,
            width: double.infinity,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
          ShimmerWidget.rectangular(
            height: 10.h,
            width: double.infinity,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
          ShimmerWidget.rectangular(
            height: 10.h,
            width: 100,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
        ],
      ),
    );
  }
}
