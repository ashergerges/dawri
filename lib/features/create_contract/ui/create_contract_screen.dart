// lib/features/create_contract/ui/create_contract_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/day_picker_page_custom.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/core/utils/helper/validator.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/create_contract_cubit.dart';
import '../data/models/create_contract_model.dart';

@RoutePage()
class CreateContractScreen extends StatelessWidget {
  const CreateContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateContractCubit(),
      child: const _CreateContractView(),
    );
  }
}

class _CreateContractView extends StatefulWidget {
  const _CreateContractView();

  @override
  State<_CreateContractView> createState() => _CreateContractViewState();
}

class _CreateContractViewState extends State<_CreateContractView> {
  final _formKey = GlobalKey<FormState>();
  final _startDateKey = GlobalKey<_DatePickerFieldState>();
  final _endDateKey = GlobalKey<_DatePickerFieldState>();

  void _handleSubmit(BuildContext context) {
    final formValid = _formKey.currentState?.validate() ?? false;
    _startDateKey.currentState?.validate();
    _endDateKey.currentState?.validate();
    final startValid = _startDateKey.currentState?.selectedDate != null;
    final endValid = _endDateKey.currentState?.selectedDate != null;

    if (formValid && startValid && endValid) {
      _formKey.currentState?.save();
      context.read<CreateContractCubit>().sendContractOffer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateContractCubit, CreateContractState>(
        listenWhen: (p, c) => p.isSuccess != c.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const _SuccessModal(),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const _SubHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        const _TargetUserCard(),
                        const _ContractTypeSection(),
                        _DurationSection(startDateKey: _startDateKey, endDateKey: _endDateKey),
                        const _PaymentSection(),
                        const _NotesSection(),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ),
              ),
              _SubmitBottomBar(onSubmit: () => _handleSubmit(context)),
            ],
          );
        },
      ),
    );
  }
}

// ─── SUB HEADER ────────────────────────────────────────────────────────────
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
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: AppColors.slate100, shape: BoxShape.circle),
              child: SizedBox(
                width: 40.w,
                height: 40.w,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.arrowRight, size: 18.sp, color: AppColors.textDark),
                ),
              ),
            ),
          ),
          Text(
            LocaleKeys.createContractTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(width: 40.w),
        ],
      ),
    );
  }
}

// ─── TARGET USER CARD ────────────────────────────────────────────────────────
class _TargetUserCard extends StatelessWidget {
  const _TargetUserCard();

  @override
  Widget build(BuildContext context) {
    final target = CreateContractMockData.targetUser;
    return Padding(
      padding: 20.w.padAll,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.slate200),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.03),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: 15.w.padAll,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: CustomNetworkImage(
                  imageUrl: target.avatarUrl,
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.cover,
                ),
              ),
              15.w.sizedWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      target.name,
                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    4.h.sizedHeight,
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.secondary50,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                            child: Text(
                              target.roleBadgeKey.tr(),
                              style: AppTextTheme.bodyXXSmall(context).copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryLight,
                              ),
                            ),
                          ),
                        ),
                        6.w.sizedWidth,
                        Expanded(
                          child: Text(
                            target.specialtyKey.tr(),
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMuted,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── SECTION TITLE (shared) ──────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String titleKey;

  const _SectionTitle({required this.icon, required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon, size: 16.sp, color: AppColors.primaryLight),
        8.w.sizedWidth,
        Text(
          titleKey.tr(),
          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}

// ─── CONTRACT TYPE SECTION ───────────────────────────────────────────────────
class _ContractTypeSection extends StatelessWidget {
  const _ContractTypeSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: FontAwesomeIcons.layerGroup, titleKey: LocaleKeys.createContractTypeTitle),
          12.h.sizedHeight,
          BlocBuilder<CreateContractCubit, CreateContractState>(
            buildWhen: (p, c) => p.selectedType != c.selectedType,
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: _ChoiceChip(
                      labelKey: LocaleKeys.createContractTypePlayer,
                      isSelected: state.selectedType == ContractType.player,
                      onTap: () => context.read<CreateContractCubit>().selectType(ContractType.player),
                    ),
                  ),
                  10.w.sizedWidth,
                  Expanded(
                    child: _ChoiceChip(
                      labelKey: LocaleKeys.createContractTypeCoaching,
                      isSelected: state.selectedType == ContractType.coaching,
                      onTap: () => context.read<CreateContractCubit>().selectType(ContractType.coaching),
                    ),
                  ),
                  10.w.sizedWidth,
                  Expanded(
                    child: _ChoiceChip(
                      labelKey: LocaleKeys.createContractTypeRefereeing,
                      isSelected: state.selectedType == ContractType.refereeing,
                      onTap: () => context.read<CreateContractCubit>().selectType(ContractType.refereeing),
                    ),
                  ),
                ],
              );
            },
          ),
          20.h.sizedHeight,
        ],
      ),
    );
  }
}

class _ChoiceChip extends StatelessWidget {
  final String labelKey;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChoiceChip({required this.labelKey, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.slate100 : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.slate200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(14.r),
          // boxShadow: isSelected
          //     ? [
          //   BoxShadow(
          //     color: AppColors.primary.withOpacity(0.1),
          //     blurRadius: 10,
          //     offset: const Offset(0, 4),
          //   ),
          // ]
          //     : null,
        ),
        child: Text(
          labelKey.tr(),
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: isSelected ? AppColors.primary : AppColors.textMuted,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// ─── DURATION SECTION ─────────────────────────────────────────────────────────
class _DurationSection extends StatelessWidget {
  final GlobalKey<_DatePickerFieldState> startDateKey;
  final GlobalKey<_DatePickerFieldState> endDateKey;

  const _DurationSection({required this.startDateKey, required this.endDateKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: FontAwesomeIcons.calendarDays, titleKey: LocaleKeys.createContractDurationTitle),
          12.h.sizedHeight,
          Row(
            children: [
              Expanded(
                child: _DatePickerField(
                  key: startDateKey,
                  label: LocaleKeys.createContractStartDate.tr(),
                  onDateSelected: (_) {},
                ),
              ),
              12.w.sizedWidth,
              Expanded(
                child: _DatePickerField(
                  key: endDateKey,
                  label: LocaleKeys.createContractEndDate.tr(),
                  onDateSelected: (_) {},
                ),
              ),
            ],
          ),
          15.h.sizedHeight,
          _InputField(
            icon: FontAwesomeIcons.clock,
            label: LocaleKeys.createContractTotalHours.tr(),
            hint: LocaleKeys.createContractTotalHoursHint.tr(),
            keyboardType: TextInputType.number,
            onSaved: (v) => context.read<CreateContractCubit>().updateTotalHours(v ?? ''),
          ),
          20.h.sizedHeight,
        ],
      ),
    );
  }
}

// ─── PAYMENT SECTION ──────────────────────────────────────────────────────────
class _PaymentSection extends StatelessWidget {
  const _PaymentSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: FontAwesomeIcons.sackDollar, titleKey: LocaleKeys.createContractValueTitle),
          12.h.sizedHeight,
          _InputField(
            icon: FontAwesomeIcons.moneyBill,
            label: LocaleKeys.createContractAgreedValue.tr(),
            hint: '0',
            keyboardType: TextInputType.number,
            validator: Validator.validate,
            suffixLabel: LocaleKeys.createContractCurrency.tr(),
            onSaved: (v) => context.read<CreateContractCubit>().updateContractValue(v ?? ''),
          ),
          10.h.sizedHeight,
          BlocBuilder<CreateContractCubit, CreateContractState>(
            buildWhen: (p, c) => p.selectedPaymentType != c.selectedPaymentType,
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: _ChoiceChip(
                      labelKey: LocaleKeys.createContractPayOnce,
                      isSelected: state.selectedPaymentType == PaymentType.oneTime,
                      onTap: () =>
                          context.read<CreateContractCubit>().selectPaymentType(PaymentType.oneTime),
                    ),
                  ),
                  10.w.sizedWidth,
                  Expanded(
                    child: _ChoiceChip(
                      labelKey: LocaleKeys.createContractPayMonthly,
                      isSelected: state.selectedPaymentType == PaymentType.monthly,
                      onTap: () =>
                          context.read<CreateContractCubit>().selectPaymentType(PaymentType.monthly),
                    ),
                  ),
                  10.w.sizedWidth,
                  Expanded(
                    child: _ChoiceChip(
                      labelKey: LocaleKeys.createContractPayPerMatch,
                      isSelected: state.selectedPaymentType == PaymentType.perMatch,
                      onTap: () =>
                          context.read<CreateContractCubit>().selectPaymentType(PaymentType.perMatch),
                    ),
                  ),
                ],
              );
            },
          ),
          20.h.sizedHeight,
        ],
      ),
    );
  }
}

// ─── NOTES SECTION ────────────────────────────────────────────────────────────
class _NotesSection extends StatelessWidget {
  const _NotesSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: FontAwesomeIcons.penClip, titleKey: LocaleKeys.createContractNotesTitle),
          12.h.sizedHeight,
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.slate200, width: 1.5),
            ),
            child: TextFormField(
              maxLines: 4,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              onSaved: (v) => context.read<CreateContractCubit>().updateNotes(v ?? ''),
              decoration: InputDecoration(
                hintText: LocaleKeys.createContractNotesHint.tr(),
                hintStyle: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textHint,
                ),
                border: InputBorder.none,
                contentPadding: 15.w.padAll,
              ),
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── INPUT FIELD ──────────────────────────────────────────────────────────
class _InputField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final String? suffixLabel;

  const _InputField({
    required this.icon,
    required this.label,
    required this.hint,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.suffixLabel,
  });

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        8.h.sizedHeight,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: _errorText != null ? AppColors.error : AppColors.slate200,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: FaIcon(
                  widget.icon,
                  size: 16.sp,
                  color: _errorText != null ? AppColors.error : AppColors.textMuted,
                ),
              ),
              Expanded(
                child: TextFormField(
                  onSaved: widget.onSaved,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  validator: (value) {
                    final error = widget.validator?.call(value);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) setState(() => _errorText = error);
                    });
                    return null;
                  },
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textHint,
                    ),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                  ),
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              if (widget.suffixLabel != null)
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    widget.suffixLabel!,
                    style: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (_errorText != null) ...[
          4.h.sizedHeight,
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.circleExclamation, size: 11, color: AppColors.error),
              4.w.sizedWidth,
              Text(
                _errorText!,
                style: AppTextTheme.bodyXXSmall(context).copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

// ─── DATE PICKER FIELD ────────────────────────────────────────────────────────
class _DatePickerField extends StatefulWidget {
  final String label;
  final Function(DateTime?) onDateSelected;

  const _DatePickerField({super.key, required this.label, required this.onDateSelected});

  @override
  State<_DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<_DatePickerField> {
  DateTime? selectedDate;
  String? _errorText;

  void validate() {
    if (selectedDate == null) {
      setState(() => _errorText = LocaleKeys.createContractDateRequired.tr());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        8.h.sizedHeight,
        GestureDetector(
          onTap: _showDatePicker,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: _errorText != null ? AppColors.error : AppColors.slate200,
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.calendar,
                    size: 16.sp,
                    color: _errorText != null ? AppColors.error : AppColors.textMuted,
                  ),
                  10.w.sizedWidth,
                  Expanded(
                    child: Text(
                      selectedDate != null
                          ? '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}'
                          : LocaleKeys.createContractSelectDate.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: selectedDate != null ? AppColors.textDark : AppColors.textHint,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_errorText != null) ...[
          4.h.sizedHeight,
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.circleExclamation, size: 11, color: AppColors.error),
              4.w.sizedWidth,
              Text(
                _errorText!,
                style: AppTextTheme.bodyXXSmall(context).copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  void _showDatePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) => SizedBox(
        height: 420.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: DayPickerPage(
            initialDate: selectedDate ?? DateTime.now(),
            availableDates: List.generate(31, (index) => index + 1),
            onChanged: (date) {
              setState(() {
                selectedDate = date;
                _errorText = null;
              });
              widget.onDateSelected(date);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

// ─── SUBMIT BOTTOM BAR ────────────────────────────────────────────────────────
class _SubmitBottomBar extends StatelessWidget {
  final VoidCallback onSubmit;
  const _SubmitBottomBar({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 25,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: 20.w.padAll,
          child: BlocBuilder<CreateContractCubit, CreateContractState>(
            buildWhen: (p, c) => p.isLoading != c.isLoading,
            builder: (context, state) {
              return GestureDetector(
                onTap: state.isLoading ? null : onSubmit,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: state.isLoading ? AppColors.slate400 : AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.25),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Center(
                      child: state.isLoading
                          ? SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white),
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.createContractSubmit.tr(),
                            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                            ),
                          ),
                          10.w.sizedWidth,
                          const FaIcon(FontAwesomeIcons.paperPlane, size: 16, color: AppColors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ─── SUCCESS MODAL ────────────────────────────────────────────────────────────
class _SuccessModal extends StatelessWidget {
  const _SuccessModal();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 80.w,
                height: 80.w,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.check, size: 32.sp, color: AppColors.success),
                ),
              ),
            ),
            20.h.sizedHeight,
            Text(
              LocaleKeys.createContractSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.createContractSuccessDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            25.h.sizedHeight,
            GestureDetector(
              onTap: () {
               context.router.replaceAll([HomeBottomTabsRoute(),ContractsRoute()],updateExistingRoutes: false);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.slate100,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Center(
                    child: Text(
                      LocaleKeys.createContractBackToManagement.tr(),
                      style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}