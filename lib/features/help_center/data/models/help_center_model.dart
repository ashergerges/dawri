// lib/features/help_center/data/models/help_center_model.dart
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'help_center_model.g.dart';

// ─── CATEGORY ───────────────────────────────────────────────────────────────
@JsonSerializable(createToJson: false)
class FaqCategoryModel {
  final int? id;
  final String? title;
  final String? subtitle;

  /// Stable machine name used to pick the icon locally, so adding a category
  /// server-side never ships a broken glyph. See [icon].
  final String? slug;

  @JsonKey(name: 'faqs_count')
  final int? faqsCount;

  const FaqCategoryModel({
    this.id,
    this.title,
    this.subtitle,
    this.slug,
    this.faqsCount,
  });

  factory FaqCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryModelFromJson(json);

  String get titleText => title ?? '';
  String get subtitleText => subtitle ?? '';

  IconData get icon => switch (slug) {
        'bookings' => FontAwesomeIcons.calendarCheck,
        'wallet' || 'payments' => FontAwesomeIcons.wallet,
        'tournaments' || 'championships' => FontAwesomeIcons.trophy,
        'account' || 'profile' => FontAwesomeIcons.user,
        'challenges' => FontAwesomeIcons.bolt,
        'teams' => FontAwesomeIcons.shieldHalved,
        _ => FontAwesomeIcons.circleQuestion,
      };

  Color get iconColor => AppColors.primaryLight;
}

// ─── FAQ ────────────────────────────────────────────────────────────────────
@JsonSerializable(createToJson: false)
class FaqModel {
  final int? id;
  final String? question;
  final String? answer;

  @JsonKey(name: 'category_id')
  final int? categoryId;

  const FaqModel({this.id, this.question, this.answer, this.categoryId});

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  String get questionText => question ?? '';
  String get answerText => answer ?? '';

  /// Key for the accordion's open/closed state.
  String get key => 'faq_${id ?? questionText.hashCode}';

  bool matches(String query) {
    if (query.trim().isEmpty) return true;
    final q = query.toLowerCase();
    return questionText.toLowerCase().contains(q) ||
        answerText.toLowerCase().contains(q);
  }
}

/// Bundled copy of the help content, shown when the API is unreachable so the
/// screen is never blank offline. Built from the existing translation keys.
class HelpCenterFallbackData {
  const HelpCenterFallbackData._();

  // Negative ids so they can never collide with server ids.
  static const int _catBookings = -1;
  static const int _catWallet = -2;
  static const int _catTournaments = -3;
  static const int _catAccount = -4;

  static List<FaqCategoryModel> categories() => [
        FaqCategoryModel(
          id: _catBookings,
          slug: 'bookings',
          title: LocaleKeys.helpCatBookingsTitle.tr(),
          subtitle: LocaleKeys.helpCatBookingsSubtitle.tr(),
        ),
        FaqCategoryModel(
          id: _catWallet,
          slug: 'wallet',
          title: LocaleKeys.helpCatWalletTitle.tr(),
          subtitle: LocaleKeys.helpCatWalletSubtitle.tr(),
        ),
        FaqCategoryModel(
          id: _catTournaments,
          slug: 'tournaments',
          title: LocaleKeys.helpCatTourTitle.tr(),
          subtitle: LocaleKeys.helpCatTourSubtitle.tr(),
        ),
        FaqCategoryModel(
          id: _catAccount,
          slug: 'account',
          title: LocaleKeys.helpCatAccountTitle.tr(),
          subtitle: LocaleKeys.helpCatAccountSubtitle.tr(),
        ),
      ];

  static List<FaqModel> faqs() => [
        FaqModel(
          id: -1,
          categoryId: _catBookings,
          question: LocaleKeys.helpFaq1Q.tr(),
          answer: LocaleKeys.helpFaq1A.tr(),
        ),
        FaqModel(
          id: -2,
          categoryId: _catWallet,
          question: LocaleKeys.helpFaq2Q.tr(),
          answer: LocaleKeys.helpFaq2A.tr(),
        ),
        FaqModel(
          id: -3,
          categoryId: _catTournaments,
          question: LocaleKeys.helpFaq3Q.tr(),
          answer: LocaleKeys.helpFaq3A.tr(),
        ),
        FaqModel(
          id: -4,
          categoryId: _catWallet,
          question: LocaleKeys.helpFaq4Q.tr(),
          answer: LocaleKeys.helpFaq4A.tr(),
        ),
      ];
}
