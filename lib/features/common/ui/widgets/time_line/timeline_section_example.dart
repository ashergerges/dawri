import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import '../../../data/local/models/time_line_model.dart';
import 'custom_time_line_node.dart';

class TimelineSectionExample extends StatelessWidget {
  const TimelineSectionExample({super.key, required this.data});

  final List<TimeLineModel> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: List.generate(
          data.length,
          (index) => CustomTimeLineNode(
            isStart: index == 0 && data.length > 1,
            isCenter: index != data.length - 1,
            isCompleted: data[index].isCompleted,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(data[index].title, style: AppTextTheme.bodySmall(context)),
                    ),
                    Expanded(
                      child: Text(
                        DateFormat.yMMMd().format(data[index].dateTime),
                        textAlign: TextAlign.end,
                        style: AppTextTheme.bodySmall(context),
                      ),
                    ),
                  ],
                ),
                Text(data[index].price, style: AppTextTheme.bodySmall(context)),
                Text(
                  data[index].hint ?? '',
                  style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.neutral400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
