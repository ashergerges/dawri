// lib/features/login/ui/widgets/auth_scaffold.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';

/// Shared scaffold shell (hero + white interaction card) used by both
/// [LoginScreen] and [VerificationScreen], extracted as-is from the
/// original combined `_LoginView`/`_LoginHero`/`_InteractionCard` so the
/// visual identity is byte-for-byte unchanged across both steps.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.child});

  /// The step-specific content placed inside the white card
  /// (e.g. `_PhoneStep` or `_OtpStep`).
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slate200,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Stack(
                children: [
                  SizedBox(width: double.infinity, height: 0.60.sh, child: const _AuthHero()),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 0.52.sh,
                    child: _AuthInteractionCard(child: child),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── HERO ───────────────────────────────────────────────────────────────────
class _AuthHero extends StatelessWidget {
  const _AuthHero();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [AppColors.heroLightGreen, AppColors.heroDarkGreen],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 180.w,
              height: 180.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accentLime.withOpacity(0.4),
                boxShadow: [
                  BoxShadow(color: AppColors.accentLime.withOpacity(0.4), blurRadius: 60, spreadRadius: 20),
                ],
              ),
            ),
            FaIcon(FontAwesomeIcons.futbol, size: 70.sp, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}

// ─── INTERACTION CARD ───────────────────────────────────────────────────────
class _AuthInteractionCard extends StatelessWidget {
  const _AuthInteractionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 30, offset: const Offset(0, -10)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25.w, 35.h, 25.w, 20.h),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: child,
        ),
      ),
    );
  }
}