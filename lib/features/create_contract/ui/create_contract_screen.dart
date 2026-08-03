// lib/features/create_contract/ui/create_contract_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/app_time_format.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
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

@RoutePage()
class CreateContractScreen extends StatelessWidget {
  const CreateContractScreen({
    super.key,
    required this.userId,
    required this.name,
    this.avatar,
  });

  /// The person the contract is drafted with — passed in from the opening card.
  final int userId;
  final String name;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateContractCubit(userId: userId)..loadOptions(),
      child: _CreateContractView(name: name, avatar: avatar),
    );
  }
}

class _CreateContractView extends StatefulWidget {
  const _CreateContractView({required this.name, this.avatar});

  final String name;
  final String? avatar;

  @override
  State<_CreateContractView> createState() => _CreateContractViewState();
}

class _CreateContractViewState extends State<_CreateContractView> {
  final _formKey = GlobalKey<FormState>();
  final _startDateKey = GlobalKey<_DatePickerFieldState>();
  final _endDateKey = GlobalKey<_DatePickerFieldState>();

  void _handleSubmit(BuildContext context) {
    // Surface inline errors first, then let the cubit run the full validation.
    _formKey.currentState?.validate();
    _startDateKey.currentState?.validate();
    _endDateKey.currentState?.validate();
    context.read<CreateContractCubit>().submit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreateContractCubit, CreateContractState>(
        listenWhen: (p, c) => p.isSuccess != c.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) context.router.replaceAll([HomeBottomTabsRoute(),PartnersRoute()],updateExistingRoutes: false);
        },
        child: Column(
          children: [
            const _SubHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      _TargetUserCard(name: widget.name, avatar: widget.avatar),
                      const _ContractTypeSection(),
                      _DurationSection(
                        startDateKey: _startDateKey,
                        endDateKey: _endDateKey,
                      ),
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
        ),
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

// ─── TARGET USER CARD (read-only) ────────────────────────────────────────────
class _TargetUserCard extends StatelessWidget {
  const _TargetUserCard({required this.name, this.avatar});

  final String name;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
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
                  imageUrl: avatar ?? '',
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
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    6.h.sizedHeight,
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.secondary50,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                        child: Text(
                          LocaleKeys.createContractTargetLabel.tr(),
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ),
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
        const _RequiredMark(),
      ],
    );
  }
}

/// The red asterisk every field carries — nothing on this form is optional.
class _RequiredMark extends StatelessWidget {
  const _RequiredMark();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w, left: 4.w),
      child: Text(
        '*',
        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
          fontWeight: FontWeight.w900,
          color: AppColors.error,
        ),
      ),
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
          _SectionTitle(
            icon: FontAwesomeIcons.layerGroup,
            titleKey: LocaleKeys.createContractTypeTitle,
          ),
          12.h.sizedHeight,
          BlocBuilder<CreateContractCubit, CreateContractState>(
            buildWhen: (p, c) =>
                p.contractTypes != c.contractTypes ||
                p.optionsStatus != c.optionsStatus ||
                p.selectedContractTypeId != c.selectedContractTypeId,
            builder: (context, state) {
              if (state.isLoadingOptions) return const _ChipsShimmer();
              if (state.contractTypes.isEmpty) {
                return _OptionsErrorRetry(
                  onRetry: () => context.read<CreateContractCubit>().loadOptions(),
                );
              }
              return _ChoiceChipsWrap(
                items: {
                  for (final type in state.contractTypes)
                    (type.id ?? 0): type.name ?? '',
                },
                selectedId: state.selectedContractTypeId,
                onSelected: context.read<CreateContractCubit>().selectContractType,
              );
            },
          ),
          20.h.sizedHeight,
        ],
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
    final cubit = context.read<CreateContractCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: FontAwesomeIcons.calendarDays,
            titleKey: LocaleKeys.createContractDurationTitle,
          ),
          12.h.sizedHeight,
          Row(
            children: [
              Expanded(
                child: _DatePickerField(
                  key: startDateKey,
                  label: LocaleKeys.createContractStartDate.tr(),
                  onDateSelected: (date) =>
                      cubit.updateStartDate(AppTimeFormat.convertSentDate(date) ?? ''),
                ),
              ),
              12.w.sizedWidth,
              Expanded(
                child: _DatePickerField(
                  key: endDateKey,
                  label: LocaleKeys.createContractEndDate.tr(),
                  onDateSelected: (date) =>
                      cubit.updateEndDate(AppTimeFormat.convertSentDate(date) ?? ''),
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
            validator: Validator.validateTotalHours,
            onChanged: cubit.updateTotalHours,
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
          _SectionTitle(
            icon: FontAwesomeIcons.sackDollar,
            titleKey: LocaleKeys.createContractValueTitle,
          ),
          12.h.sizedHeight,
          _InputField(
            icon: FontAwesomeIcons.moneyBill,
            label: LocaleKeys.createContractAgreedValue.tr(),
            hint: '0',
            keyboardType: TextInputType.number,
            validator: Validator.validateAmount,
            suffixLabel: LocaleKeys.createContractCurrency.tr(),
            onChanged: context.read<CreateContractCubit>().updateAmount,
          ),
          12.h.sizedHeight,
          BlocBuilder<CreateContractCubit, CreateContractState>(
            buildWhen: (p, c) =>
                p.salaryTypes != c.salaryTypes ||
                p.optionsStatus != c.optionsStatus ||
                p.selectedSalaryTypeId != c.selectedSalaryTypeId,
            builder: (context, state) {
              if (state.isLoadingOptions) return const _ChipsShimmer();
              if (state.salaryTypes.isEmpty) {
                return _OptionsErrorRetry(
                  onRetry: () => context.read<CreateContractCubit>().loadOptions(),
                );
              }
              return _ChoiceChipsWrap(
                items: {
                  for (final type in state.salaryTypes) (type.id ?? 0): type.name ?? '',
                },
                selectedId: state.selectedSalaryTypeId,
                onSelected: context.read<CreateContractCubit>().selectSalaryType,
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
          _SectionTitle(
            icon: FontAwesomeIcons.penClip,
            titleKey: LocaleKeys.createContractNotesTitle,
          ),
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
              validator: Validator.validateNotes,
              onChanged: context.read<CreateContractCubit>().updateNotes,
              decoration: InputDecoration(
                hintText: LocaleKeys.createContractNotesHint.tr(),
                hintStyle: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textHint,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                errorStyle: AppTextTheme.bodyXXSmall(context).copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
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

// ─── CHOICE CHIPS (dynamic lookups) ───────────────────────────────────────────
class _ChoiceChipsWrap extends StatelessWidget {
  final Map<int, String> items; // id -> label (already localized by the API)
  final int? selectedId;
  final ValueChanged<int> onSelected;

  const _ChoiceChipsWrap({
    required this.items,
    required this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: items.entries
          .map((e) => _ChoiceChip(
                label: e.value,
                isSelected: selectedId == e.key,
                onTap: () => onSelected(e.key),
              ))
          .toList(),
    );
  }
}

class _ChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChoiceChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.slate100 : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.slate200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Text(
          label,
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

class _ChipsShimmer extends StatelessWidget {
  const _ChipsShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (i) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: i == 2 ? 0 : 10.w),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 45.h),
          ),
        ),
      ),
    );
  }
}

class _OptionsErrorRetry extends StatelessWidget {
  final VoidCallback onRetry;
  const _OptionsErrorRetry({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.circleExclamation, size: 13.sp, color: AppColors.error),
        6.w.sizedWidth,
        Expanded(
          child: Text(
            LocaleKeys.errorGeneric.tr(),
            style: AppTextTheme.bodyXSmall(context)
                .copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
          ),
        ),
        TextButton(
          onPressed: onRetry,
          child: Text(
            LocaleKeys.tryAgain.tr(),
            style: AppTextTheme.bodyXSmall(context)
                .copyWith(fontWeight: FontWeight.w800, color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}

// ─── INPUT FIELD ──────────────────────────────────────────────────────────
class _InputField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? suffixLabel;

  const _InputField({
    required this.icon,
    required this.label,
    required this.hint,
    this.validator,
    this.onChanged,
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
        Row(
          children: [
            Text(
              widget.label,
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textMuted,
              ),
            ),
            const _RequiredMark(),
          ],
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
                  onChanged: widget.onChanged,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  validator: (value) {
                    final error = widget.validator?.call(value);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted && _errorText != error) {
                        setState(() => _errorText = error);
                      }
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
        Row(
          children: [
            Expanded(
              child: Text(
                widget.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textMuted,
                ),
              ),
            ),
            const _RequiredMark(),
          ],
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
              Expanded(
                child: Text(
                  _errorText!,
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
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
            buildWhen: (p, c) =>
                p.submitStatus != c.submitStatus || p.isFormComplete != c.isFormComplete,
            builder: (context, state) {
              // Stays disabled until every required field holds a valid value.
              final isEnabled = state.isFormComplete && !state.isSubmitting;

              return GestureDetector(
                onTap: isEnabled ? onSubmit : null,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isEnabled ? AppColors.primary : AppColors.slate400,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: isEnabled
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.25),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ]
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Center(
                      child: state.isSubmitting
                          ? SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.white,
                              ),
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
                                const FaIcon(
                                  FontAwesomeIcons.paperPlane,
                                  size: 16,
                                  color: AppColors.white,
                                ),
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
