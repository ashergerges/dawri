import 'dart:developer';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/responsive.dart';
import 'package:dawri/core/utils/constants/theme.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../../../gen/assets.gen.dart';
import 'on_tap.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final Function(String? s)? onChange;
  final bool isPassword;
  final bool? enabled;
  final int? maxLines;
  final bool denySpaces;
  final TextInputType? keyBord;
  final String? image;
  final String? imagePre;
  final Widget? suffixItem;
  final String? prefixText;
  final String? suffixText;
  final Color? fillColor;
  final Color? textColor;
  final IconData? icon;
  final IconData? iconPre;
  final Function()? suffixPressed;
  final Function()? onTap;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? fileInputController;
  final String? Function(String?)? validator;
  final BorderSide? borderSide;
  final EdgeInsets? contentPadding;
  final String? initialValue;
  final double? radius;
  final FocusNode? focusNode;
  final bool isLTR;

  const AppTextField({
    super.key,
    required this.label,
    this.onChange,
    this.denySpaces = false,
    this.isPassword = false,
    this.enabled,
    this.maxLines = 1,
    this.image,
    this.imagePre,
    this.icon,
    this.iconPre,
    this.fillColor,
    this.suffixPressed,
    this.fileInputController,
    this.validator,
    this.keyBord,
    this.textInputFormatter,
    this.borderSide,
    this.contentPadding,
    this.initialValue,
    this.prefixText,
    this.radius,
    this.focusNode,
    this.suffixItem,
    this.textColor,
    this.suffixText,
    this.onTap,
    this.isLTR = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = false;
  String? initialValue;

  @override
  void initState() {
    isObscure = widget.isPassword;
    initialValue = widget.initialValue;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the currentDate has changed and update the controller
    if (oldWidget.initialValue != widget.initialValue &&
        widget.initialValue != null) {
      setState(() {
        initialValue = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: lightColorScheme.copyWith(
          surface: AppColors.primary200,
          onSurface: AppColors.black,
          surfaceContainerHighest: AppColors.black,
        ),
      ),
      child: TextFormField(
        onTapOutside: (v) {
          FocusManager.instance.primaryFocus?.unfocus();
        },

        textAlign: TextAlign.start,
        enabled: widget.enabled,
        initialValue: initialValue,
        onChanged: widget.onChange,
        keyboardType: widget.keyBord,
        validator: widget.validator,
        maxLines: widget.maxLines,
        autofocus: false,
        cursorColor: AppColors.primary,
        focusNode: widget.focusNode,
        textDirection: widget.isLTR ? TextDirection.ltr : null,
        contextMenuBuilder: (context, editableTextState) {
          return widget.isPassword
              ? AdaptiveTextSelectionToolbar.buttonItems(
                  anchors: editableTextState.contextMenuAnchors,
                  buttonItems: [
                    const ContextMenuButtonItem(
                      onPressed: null,
                      type: ContextMenuButtonType.copy,
                    ),
                    const ContextMenuButtonItem(
                      onPressed: null,
                      type: ContextMenuButtonType.cut,
                    ),
                    ContextMenuButtonItem(
                      onPressed: () => editableTextState.pasteText(
                        SelectionChangedCause.keyboard,
                      ),
                      type: ContextMenuButtonType.paste,
                    ),
                    const ContextMenuButtonItem(
                      onPressed: null,
                      type: ContextMenuButtonType.selectAll,
                    ),
                  ],
                )
              : AdaptiveTextSelectionToolbar.editableText(
                  editableTextState: editableTextState,
                );
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isObscure,
        controller: widget.fileInputController,
        inputFormatters: [
          if (widget.denySpaces)
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ...?widget.textInputFormatter,
          if (widget.isPassword)
            FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-Z0-9!@#\$&*~()\-_+={}[\]:;<>,.?/\\|`^% ]'),
            ),
        ],
        style: AppTextTheme.bodyMedium(
          context,
        ).copyWith(color: widget.textColor),
        onTap: widget.onTap,
        decoration: InputDecoration(
          prefixText: widget.prefixText,
          prefixStyle: AppTextTheme.bodyMedium(
            context,
          ).copyWith(color: AppColors.neutral400),
          alignLabelWithHint: true,
          filled: true,

          fillColor: widget.fillColor ?? AppColors.white,
          hintText: widget.label,
          errorStyle: AppTextTheme.bodyXSmall(
            context,
          ).copyWith(color: AppColors.error),
          hintStyle: AppTextTheme.bodySmall(context),
          prefixIcon: widget.iconPre != null || widget.imagePre != null
              ? widget.iconPre != null
                    ? Icon(widget.iconPre, size: 25.h)
                    : Padding(
                        padding: 17.padStart,
                        child: SvgPicture.asset(
                          widget.imagePre.toString(),
                          height: ResponsiveScreen.iconSize(
                            context: context,
                            sizeMobile: 17.h,
                          ),
                          // colorFilter: const ColorFilter.mode(AppColors.neutral200, BlendMode.srcIn),
                          fit: BoxFit.contain,
                        ),
                      )
              : null,
          contentPadding:
              widget.contentPadding ??
              (ResponsiveScreen.isTablet(context: context)
                      ? 30.padVertical
                      : 0.padVertical) +
                  (15.padHorizontal),
          suffixText: widget.suffixText,
          // suffix: widget.suffixItem,
          suffixStyle: AppTextTheme.bodyMedium(
            context,
          ).copyWith(color: AppColors.neutral200, height: 0.05.w),
          suffixIcon: widget.suffixItem != null
              ? OnTap(
                  onTap: () {
                    widget.suffixPressed?.call();
                  },
                  child: widget.suffixItem!,
                )
              : (widget.icon != null || widget.image != null
                    ? IconButton(
                        onPressed: () async {
                          log("pressed1");
                          // FocusScope.of(context).unfocus();
                          // SystemChannels.textInput.invokeMethod('TextInput.hide');
                          // await Future.delayed(const Duration(milliseconds: 100));
                          // widget.focusNode
                          widget.suffixPressed?.call();
                        },
                        icon: widget.icon != null
                            ? Icon(
                                widget.icon,
                                size: 25.h,
                                color: AppColors.neutral200,
                              )
                            : Padding(
                                padding: 17.padHorizontal,
                                child: SvgPicture.asset(
                                  widget.image.toString(),
                                  height: ResponsiveScreen.iconSize(
                                    context: context,
                                    sizeMobile: 20.h,
                                  ),
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.neutral200,
                                    BlendMode.srcIn,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      )
                    : (widget.isPassword)
                    ? Padding(
                        padding: ResponsiveScreen.isTablet(context: context)
                            ? 20.padHorizontal
                            : 6.padHorizontal,
                        child: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () =>
                              setState(() => isObscure = !isObscure),
                          icon: (isObscure)
                              ? Assets.svg.eyeClose.svg(
                                  height: ResponsiveScreen.iconSize(
                                    context: context,
                                    sizeMobile: 17.h,
                                  ),
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.neutral200,
                                    BlendMode.srcIn,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : Assets.svg.eye.svg(
                                  height: ResponsiveScreen.iconSize(
                                    context: context,
                                    sizeMobile: 17.h,
                                  ),
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.neutral200,
                                    BlendMode.srcIn,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )
                    : null),
          border: OutlineInputBorder(
            borderSide:
                widget.borderSide ??
                const BorderSide(color: AppColors.primary100),
            borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          ),

          disabledBorder: OutlineInputBorder(
            borderSide:
                widget.borderSide ??
                const BorderSide(color: AppColors.primary100),
            borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                widget.borderSide ?? const BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                widget.borderSide ??
                const BorderSide(color: AppColors.primary100),
            borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          ),
        ),
      ),
    );
  }
}

class AppTextFieldWithTitle extends StatelessWidget {
  final String label;
  final String title;
  final Function(String? s)? onChange;
  final bool isPassword;
  final bool? enabled;
  final int? maxLines;
  final bool denySpaces;
  final TextInputType? keyBord;
  final String? image;
  final String? imagePre;
  final Widget? suffixItem;
  final String? prefixText;
  final String? suffixText;
  final Color? fillColor;
  final Color? textColor;
  final IconData? icon;
  final IconData? iconPre;
  final Function()? suffixPressed;
  final Function()? onTap;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? fileInputController;
  final String? Function(String?)? validator;
  final BorderSide? borderSide;
  final EdgeInsets? contentPadding;
  final String? initialValue;
  final double? radius;
  final FocusNode? focusNode;
  final bool isLTR;

  const AppTextFieldWithTitle({
    super.key,
    required this.label,
    required this.title,
    this.onChange,
    this.denySpaces = false,
    this.isPassword = false,
    this.enabled,
    this.maxLines = 1,
    this.image,
    this.imagePre,
    this.icon,
    this.iconPre,
    this.fillColor,
    this.suffixPressed,
    this.fileInputController,
    this.validator,
    this.keyBord,
    this.textInputFormatter,
    this.borderSide,
    this.contentPadding,
    this.initialValue,
    this.prefixText,
    this.radius,
    this.focusNode,
    this.suffixItem,
    this.suffixText,
    this.onTap,
    this.textColor,
    this.isLTR = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: 16.padHorizontal,
          child: Text(
            title,
            style: AppTextTheme.bodyMediumMediumWeight(context),
          ),
        ),
        8.verticalSpace,
        AppTextField(
          label: label,
          onChange: onChange,
          denySpaces: denySpaces,
          isPassword: isPassword,
          enabled: enabled,
          maxLines: maxLines,
          image: image,
          imagePre: imagePre,
          icon: icon,
          iconPre: iconPre,
          fillColor: fillColor,
          suffixPressed: suffixPressed,
          fileInputController: fileInputController,
          validator: validator,
          keyBord: keyBord,
          textInputFormatter: textInputFormatter,
          borderSide: borderSide,
          contentPadding: contentPadding,
          initialValue: initialValue,
          prefixText: prefixText,
          radius: radius,
          textColor: textColor,
          focusNode: focusNode,
          suffixItem: suffixItem,
          suffixText: suffixText,
          onTap: onTap,
          isLTR: isLTR,
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPhone;
  final int? maxLength;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? textInputFormatter;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPhone = false,
    this.keyboardType,
    this.onChanged,
    this.initialValue,
    this.validator,
    this.maxLength,
    this.textInputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:initialValue ,
      keyboardType: isPhone ? TextInputType.phone : keyboardType,
      onChanged: onChanged,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      inputFormatters: textInputFormatter,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextTheme.bodyMedium(
          context,
        ).copyWith(color: AppColors.neutral300),
        suffixIcon: isPhone
            ? IntrinsicWidth(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 8),

                    Text(
                      "+966",
                      style: AppTextTheme.bodyLarge(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),

                  ],
                ),
              )
            : null,

        border: InputBorder.none,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: validator,
    );
  }
}
