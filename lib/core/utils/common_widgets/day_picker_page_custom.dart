import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/responsive.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayPickerPage extends StatefulWidget {
  final Function(DateTime)? onChanged;
  final List<int> availableDates;
  final Function(DateTime)? onMonthChanged;
  final DateTime? initialDate;
  const DayPickerPage({
    super.key,
    this.onChanged,
    required this.availableDates,
    this.onMonthChanged,
    this.initialDate,
  });

  @override
  State<StatefulWidget> createState() => _DayPickerPageState();
}

class _DayPickerPageState extends State<DayPickerPage> {
  late DateTime _selectedDate;
  final DateTime _firstDate = DateTime.now();
  final DateTime _lastDate = DateTime.now().add(const Duration(days: 365 * 100));
  late List<int> availableDates;

  @override
  void initState() {
    super.initState();
    availableDates = widget.availableDates;
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  @override
  void didUpdateWidget(covariant DayPickerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.availableDates != oldWidget.availableDates) {
      setState(() {
        availableDates = widget.availableDates;
      });
    }
    if (widget.initialDate != oldWidget.initialDate) {
      setState(() {
        _selectedDate = widget.initialDate ?? DateTime.now();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    dp.DatePickerRangeStyles styles = dp.DatePickerRangeStyles(
      selectedDateStyle: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(color: AppColors.white, fontSize: 15.sp),
      selectedSingleDateDecoration: const BoxDecoration(
        color: AppColors.secondary,
        shape: BoxShape.circle,
      ),

      prevIcon: ResponsiveScreen.isTablet(context: context)
          ? Padding(
              padding: 25.padHorizontal,
              child: Icon(Icons.arrow_back_ios, size: 35.h, color: AppColors.neutral400),
            )
          : Icon(
              Icons.arrow_back_ios,
              size: 22.h,
              color: AppColors.neutral400,
            ), // Customize the left arrow
      nextIcon: ResponsiveScreen.isTablet(context: context)
          ? Padding(
              padding: 25.padHorizontal,
              child: Icon(Icons.arrow_forward_ios, size: 35.h, color: AppColors.neutral400),
            )
          : Icon(
              Icons.arrow_forward_ios,
              size: 22.h,
              color: AppColors.neutral400,
            ), // Customize the left arrow
      defaultDateTextStyle: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(color: AppColors.neutral400, fontSize: 16.sp),

      disabledDateStyle: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(color: AppColors.secondary, fontSize: 14.sp),
      currentDateStyle: TextStyle(color: AppColors.primary, fontSize: 14.sp),
      dayHeaderStyle: DayHeaderStyle(
        textStyle: TextStyle(
          color: AppColors.neutral400,
          overflow: TextOverflow.ellipsis,
          fontSize: 15.sp,
        ),
      ),
      dayHeaderTitleBuilder: _dayHeaderTitleBuilder,
    );

    return Container(
      width: double.infinity,
      padding: 5.padAll,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.neutral300, width: 2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
            titleSmall: TextStyle(
              fontSize: 18.sp,
              color: AppColors.neutral400, // Adjust the font size as needed
            ),
          ),
        ),
        child: dp.DayPicker.single(
          selectedDate: _selectedDate,
          onChanged: _onSelectedDateChanged,
          firstDate: _firstDate,
          lastDate: _lastDate,
          onMonthChanged: widget.onMonthChanged,
          datePickerStyles: styles,
          datePickerLayoutSettings: dp.DatePickerLayoutSettings(
            maxDayPickerRowCount: 5,
            dayPickerRowHeight: 50.h,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            showPrevMonthEnd: false,
            showNextMonthStart: false,
          ),
          selectableDayPredicate: _isSelectableCustom,
          eventDecorationBuilder: _eventDecorationBuilder,
        ),
      ),
    );
  }

  dp.EventDecoration? _eventDecorationBuilder(DateTime date) {
    DateTime eventDate = DateTime.now();

    bool isEventDate =
        date.year == eventDate.year && date.month == eventDate.month && eventDate.day == date.day;

    BoxDecoration roundedBorder = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.primary),
    );

    return isEventDate ? dp.EventDecoration(boxDecoration: roundedBorder) : null;
  }

  void _onSelectedDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
    widget.onChanged!(newDate);
  }

  // ignore: prefer_expression_function_bodies
  bool _isSelectableCustom(DateTime day) {
    //return day.weekday < 6;
    return day.isAfter(DateTime.now()) && availableDates.contains(day.day);
  }

  String _dayHeaderTitleBuilder(int dayOfTheWeek, List<String> localizedHeaders) =>
      localizedHeaders[dayOfTheWeek].substring(0, 3);
}
