// lib/core/utils/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // ─── Base Colors ──────────────────────────────────────────────
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color backgroundColor = Color(0xfff4f7f6);

  // ─── Primary (Main Brand Color) ──────────────────────────────
  static const Color primary = Color(0xFF115E49);
  static const Color primaryLight = Color(0xFF1ABC9C);
  static const Color primaryDark = Color(0xFF0D4636);

  // ─── Secondary ────────────────────────────────────────────────
  static const Color secondary = Color(0xFF16A34A);
  static const Color secondary50 = Color(0xFFE8F6ED);

  // ─── Text Colors ──────────────────────────────────────────────
  static const Color textDark = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textHint = Color(0xFF94A3B8);

  // ─── Background ──────────────────────────────────────────────
  static const Color background = Color(0xFFF8FAFC); // Updated to match HTML
  static const Color cardBg = Colors.white;
  static const Color surface = Colors.white;

  // ─── Status Colors ────────────────────────────────────────────
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  static const Color ratingAmber = Color(0xFFD97706);
  static const Color ratingAmberBg = Color(0xFFFEF3C7);
  // ─── Accent Colors ────────────────────────────────────────────
  static const Color purple = Color(0xFF8B5CF6);
  static const Color pink = Color(0xFFEC4899);
  static const Color teal = Color(0xFF14B8A6);
  static const Color whatsappGreen = Color(0xFF25D366);
  static const Color accentLime = Color(0xFF95C11F);
  static const Color visaBlue = Color(0xFF1D4ED8);

  // ─── Login Hero ───────────────────────────────────────────────
  static const Color heroDarkGreen = Color(0xFF03443A);
  static const Color heroLightGreen = Color(0xFF0B6C5D);

  // ─── Banner Colors ────────────────────────────────────────────
  static const Color bannerStart = Color(0xFF1E293B);
  static const Color bannerEnd = Color(0xFF0F172A);

  // ─── Neutral / Slate ──────────────────────────────────────────
  static const Color slate50 = Color(0xFFF8FAFC);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);

  // ─── Bottom Nav ───────────────────────────────────────────────
  static const Color navInactive = Color(0xFF94A3B8);
  static const Color navBorder = Color(0xFFF1F5F9);
  static const Color navShadow = Color(0x08000000);

  // ─── Contract  ───────────────────────────────────────────────
  static const Color contractsReject =  Color(0xFFFEF2F2);
  static const Color contractsStatusActive = Color(0xFFECFDF5);
  static const Color chat =  Color(0xFFE0E7FF);

  // ─── Gradients ────────────────────────────────────────────────
  static const List<Color> headerGradient = [
    Color(0xFF115E49),
    Color(0xFF0D4636),
  ];

  static const List<Color> bannerGradient = [
    Color(0xFF1E293B),
    Color(0xFF0F172A),
  ];

  // ─── Legacy (Keep for backward compatibility) ────────────────
  static const Color greenDark = primary;
  static const Color greenLight = primaryLight;
  static const Color greenDeeper = primaryDark;
  static const Color green500 = success;
  static const Color amber500 = warning;
  static const Color blue500 = info;
  static const Color purple500 = purple;
  static const Color pink500 = pink;
  static const Color teal500 = teal;
  static const Color danger = error;
  static const Color pageBg = background;
  static const List<Color> dawriHeaderGradient = headerGradient;

  // Keep old names for compatibility
  static const Color primaryOld = Color(0xFF1E5A8A);
  static const Color primary50 = Color(0xffe6e8f6);
  static const Color primary100 = Color(0xffB5C0D5);
  static const Color primary200 = Color(0xff8a95d5);
  static const Color primary300 = Color(0xff5464c1);
  static const Color primary400 = Color(0xff8597B9);
  static const Color primary600 = Color(0xff001694);
  static const Color primary700 = Color(0xff001174);
  static const Color primary800 = Color(0xff000d5a);
  static const Color primary900 = Color(0xff000a44);
  static const List<Color> linearGradientPrimary = [
    Color(0xff001277),
    Color(0xff0223E3),
  ];
  static const Color investmentHistory = Color(0xff006E74);
  static const Color investmentHistory700 = Color(0xff004E52);
  static const Color secondary15 = Color(0xFFE8F5F0);
  static const Color secondary30 = Color(0xFF2E7D6B);
  static const Color secondary100 = Color(0xffB7E2C7);
  static const Color secondary200 = Color(0xff8ad6a7);
  static const Color secondary300 = Color(0xff54c37f);
  static const Color secondary400 = Color(0xff33b866);
  static const Color secondary600 = Color(0xff00973a);
  static const Color secondary700 = Color(0xff00762d);
  static const Color secondary800 = Color(0xff005b23);
  static const Color secondary900 = Color(0xff00461b);
  static const Color neutral30 = Color(0xffFAFAFA);
  static const Color neutral50 = Color(0xffececef);
  static const Color neutral100 = Color(0xffc3c5ce);
  static const Color neutral200 = Color(0xffa7a9b6);
  static const Color neutral300 = Color(0xff7e8294);
  static const Color neutral400 = Color(0xff656980);
  static const Color neutral = Color(0xff3f4460);
  static const Color neutral600 = Color(0xff393e57);
  static const Color neutral700 = Color(0xff2d3044);
  static const Color neutral800 = Color(0xff232535);
  static const Color neutral900 = Color(0xff1a1d28);
  static const Color warning50 = Color(0xffB0B8C8);
  static const Color warning100 = Color(0xffe7e2b0);
  static const Color warning200 = Color(0xffdbd48a);
  static const Color warning300 = Color(0xffcac054);
  static const Color warning400 = Color(0xffc0b433);
  static const warningOld = Color(0xFFEAB308);
  static const Color warning600 = Color(0xffa09300);
  static const Color warning700 = Color(0xff7d7200);
  static const Color warning800 = Color(0xff615900);
  static const Color warning900 = Color(0xff4a4400);
  static const Color error50 = Color(0xfff6e6e6);
  static const Color error100 = Color(0xffe3b0b0);
  static const Color error200 = Color(0xffd68a8a);
  static const Color error300 = Color(0xffc35454);
  static const Color error400 = Color(0xffb83333);
  static const Color errorOld = Color(0xffDC2626);
  static const Color error600 = Color(0xff970000);
  static const Color error700 = Color(0xff760000);
  static const Color error800 = Color(0xff5b0000);
  static const Color error900 = Color(0xff460000);
  static const Color accent = Color(0xFF4A9AC0);
  static const Color textColor = Color(0xff333333);
  static const Color emerald = Color(0xFF0E7C5E);
  static const Color positiveLight = Color(0xFFDCFCE7);
  static const Color warningLight = Color(0xFFFEF9C3);
  static const Color negativeLight = Color(0xFFFEE2E2);
  static const Color barChartLinear = Color(0xFFE2E8F0);
  static const Color bookTotal = Color(0xFF4A6A8A);
  static const Color bgQuickQuestions = Color(0xFFF1F5F9);
  static const Color bgQuickQuestionsBorder = Color(0xFFCBD5E1);
  static const Color bgHeaderCompanyCard = Color(0xFFF8FAFC);
  static const Color exitStrategy = Color(0xFFFFF9E6);
  static const Color exitStrategyTap = Color(0xFFEEF2FA);
  static const Color heroHeaderAction = Color(0xFFC0392B);
  static const Color heroHeaderLinear = Color(0xFFE0E8FF);
  static const List<Color> barChart = [
    Color(0xFF0A2A3A),
    Color(0xFF1E5A8A),
    Color(0xFF2E7AB0),
    Color(0xFF4A9AC0),
    Color(0xFF6AB0D0),
    Color(0xFF8CC5DB),
  ];
  static const List<Color> heroHeader = [
    Color(0xFF0A1A2A),
    Color(0xFF0F2A3A),
    Color(0xFF1A3A4A),
  ];
}