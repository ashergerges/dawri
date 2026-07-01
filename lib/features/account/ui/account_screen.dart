
// lib/features/account/ui/account_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/account_cubit.dart';
import '../data/models/account_model.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountCubit(),
      child: const _AccountView(),
    );
  }
}

class _AccountView extends StatelessWidget {
  const _AccountView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                _ProfileHeader(),
                _WalletCard(),
                _AccountMenuSection(),
                _SettingsMenuSection(),
                _LogoutButton(),
                _AppVersion(),
                10.verticalSpace
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── TRANSPARENT TOP BAR ────────────────────────────────────────────────────

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Center(
            child: FaIcon(icon, size: 17.sp, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

// ─── PROFILE HEADER ─────────────────────────────────────────────────────────
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 50.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.dawriHeaderGradient,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.r),
          bottomRight: Radius.circular(35.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greenDark.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _GlassIconButton(icon: FontAwesomeIcons.bell, onTap: () {}),
              _GlassIconButton(icon: FontAwesomeIcons.qrcode, onTap: () {}),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomNetworkImage(
                    imageUrl: 'https://i.pravatar.cc/150?img=33',
                    width: 75.w,
                    height: 75.w,
                    fit: BoxFit.cover,
                    withBorder: true,
                    radius: 20,
                    borderColor: AppColors.bookTotal.withOpacity(0.3),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: Center(
                          child: FaIcon(FontAwesomeIcons.camera, size: 12.sp, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              15.w.sizedWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.accountUserName.tr(),
                      style: AppTextTheme.headingSmall(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                      ),
                    ),
                    4.h.sizedHeight,
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.circleCheck, size: 12.sp, color: AppColors.primaryLight),
                        5.w.sizedWidth,
                        Text(
                          LocaleKeys.accountVerifiedPlayer.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            color: AppColors.slate300,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── WALLET CARD ────────────────────────────────────────────────────────────
class _WalletCard extends StatelessWidget {
  const _WalletCard();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -30.h),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: 20.w.padAll,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.slate200),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 25,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: BlocBuilder<AccountCubit, AccountState>(
          buildWhen: (p, c) => p.walletBalance != c.walletBalance,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.accountWalletBalance.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textMuted,
                      ),
                    ),
                    2.h.sizedHeight,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          state.walletBalance.toStringAsFixed(2),
                          style: AppTextTheme.headingSmall(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.textDark,
                          ),
                        ),
                        4.w.sizedWidth,
                        Text(
                          LocaleKeys.accountCurrency.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                OnTap(
                  onTap: () {
                    ChargeWalletRoute().push(context);
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.secondary50,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.plus, size: 12.sp, color: AppColors.primaryLight),
                          8.w.sizedWidth,
                          Text(
                            LocaleKeys.accountRecharge.tr(),
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ─── ACCOUNT MENU SECTION ───────────────────────────────────────────────────
class _AccountMenuSection extends StatelessWidget {
  const _AccountMenuSection();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -10.h),
      child: _MenuCard(
        items: AccountMockData.accountMenu,

      ),
    );
  }
}

// ─── SETTINGS MENU SECTION ──────────────────────────────────────────────────
class _SettingsMenuSection extends StatelessWidget {
  const _SettingsMenuSection();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -10.h),
      child: BlocBuilder<AccountCubit, AccountState>(
        buildWhen: (p, c) => p.notificationsEnabled != c.notificationsEnabled,
        builder: (context, state) {
          return _MenuCard(
            items: AccountMockData.settingsMenu,
            notificationsEnabled: state.notificationsEnabled,
            onToggleNotifications: context.read<AccountCubit>().toggleNotifications,
          );
        },
      ),
    );
  }
}

// ─── REUSABLE MENU CARD ─────────────────────────────────────────────────────
class _MenuCard extends StatelessWidget {
  final List<MenuItemModel> items;
  final bool notificationsEnabled;
  final ValueChanged<bool>? onToggleNotifications;

  const _MenuCard({
    required this.items,
    this.notificationsEnabled = false,
    this.onToggleNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          return Column(
            children: [
              GestureDetector(
                onTap: item.type == MenuItemType.toggle ? null : () => item.onTap(i),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: item.iconBg,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: SizedBox(
                              width: 40.w,
                              height: 40.w,
                              child: Center(
                                child: FaIcon(item.icon, size: 16.sp, color: item.iconColor),
                              ),
                            ),
                          ),
                          15.w.sizedWidth,
                          Text(
                            item.labelKey.tr(),
                            style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                      item.type == MenuItemType.toggle
                          ? Switch(
                        value: notificationsEnabled,
                        onChanged: onToggleNotifications,
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.primaryLight,
                        inactiveThumbColor: AppColors.white,
                        inactiveTrackColor: AppColors.slate300,
                      )
                          : FaIcon(FontAwesomeIcons.chevronLeft, size: 14.sp, color: AppColors.slate300),
                    ],
                  ),
                ),
              ),
              if (i != items.length - 1)
                Padding(
                  padding: 20.w.padHorizontal,
                  child: const Divider(height: 1, color: AppColors.slate200),
                ),
            ],
          );
        }),
      ),
    );
  }
}

// ─── LOGOUT BUTTON ──────────────────────────────────────────────────────────
class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
      child: OnTap(
        onTap: (){
          MessageService.showNewCustomDialog(
            context,
            child: Padding(
              padding: 16.padAll,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.verticalSpace,
                  Text(
                    LocaleKeys.logoutTitle.tr(),
                    style: AppTextTheme.bodyLarge(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    LocaleKeys.logoutBody.tr(),
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      color: AppColors.neutral400,
                    ),
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          text: LocaleKeys.accountLogout.tr(),
                          background: AppColors.white,
                          textColor: AppColors.error,
                          onTap: () {
                            // FirebaseMessaging.instance.deleteToken();
                            getIt<ILocalPreference>()
                                .removeAuthPrefs()
                                .then((onValue) {
                              context.router.replaceAll([
                                LoginRoute(),
                              ], updateExistingRoutes: false);
                            });
                          },
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: AppButton(
                          text: LocaleKeys.championshipControlCancel.tr(),
                          onTap: () {
                            context.router.back();
                          },
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.danger.withOpacity(0.3), width: 1.5),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.arrowRightFromBracket, size: 16.sp, color: AppColors.danger),
              10.w.sizedWidth,
              Text(
                LocaleKeys.accountLogout.tr(),
                style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.danger,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── APP VERSION ────────────────────────────────────────────────────────────
class _AppVersion extends StatelessWidget {
  const _AppVersion();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Text(
          LocaleKeys.accountAppVersion.tr(),
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.slate400,
          ),
        ),
      ),
    );
  }
}