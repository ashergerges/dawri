import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      this.items,
      this.text = '',
      this.fillColor = Colors.white,
      this.onSave,
      this.borderColor,
      this.valoe,
      this.validator,
      required this.onChange,
      this.screenWidthPadding,
      this.screenHeightPadding,
      this.initialValue});

  final List<String>? items;
  final String text;
  final String? valoe;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final Function(String?)? onChange;
  final String? Function(String?)? validator;
  final double? screenWidthPadding;
  final double? screenHeightPadding;
  final String? initialValue; // Add this line
  @override
  // ignore: library_private_types_in_public_api
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _chosenValue;

  @override
  void initState() {
    super.initState();
    // Initialize _chosenValue with initialValue if it is in the list
    _chosenValue =
        widget.items?.contains(widget.initialValue) ?? false ? widget.initialValue : null;
  }

  @override
  void didUpdateWidget(covariant CustomDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        _chosenValue =
            widget.items?.contains(widget.initialValue) ?? false ? widget.initialValue : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _chosenValue =
        widget.items?.contains(widget.initialValue) ?? false ? widget.initialValue : null;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0.r),
        border: (widget.borderColor == null)
            ? Border.all(color: AppColors.secondary)
            : Border.all(color: widget.borderColor!),
        color: widget.fillColor!,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeManager.widthFromScreen(35, context)),
        child: DropdownButtonFormField<String>(
          validator: (value) {
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.secondary,
            size: SizeManager.widthFromScreen(
              13,
              context,
            ),
          ),
          iconSize: SizeManager.widthFromScreen(
            12,
            context,
          ),
          iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          value: _chosenValue,
          items: widget.items?.map(
            (String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: AppColors.neutral200, fontSize: 16.sp),
                ),
              );
            },
          ).toList(),
          hint: Text(
            widget.text,
            style: TextStyle(color: AppColors.neutral200, fontSize: 16.sp),
          ),
          onChanged: (String? value) {
            setState(
              () {
                _chosenValue = value;
              },
            );
            widget.onChange!(value);
          },
          onSaved: widget.onSave,
          //validator: widget.validator,
        ),
      ),
    );
  }
}

class CustomDropDownWithTitleShimmer extends StatelessWidget {
  const CustomDropDownWithTitleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget.rectangular(
      height: 57.h,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
