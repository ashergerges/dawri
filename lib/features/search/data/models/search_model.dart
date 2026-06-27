// lib/features/search/data/search_model.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum SearchFilter { all, team, player, tour }

class FilterChipData {
  final SearchFilter filter;
  final String labelKey;

  const FilterChipData({required this.filter, required this.labelKey});
}

class SearchResultData {
  final String id;
  final SearchFilter type;
  final String? imageUrl;
  final String titleBeforeHighlight;
  final String highlightedTerm;
  final String titleAfterHighlight;
  final String badgeLabelKey;
  final Color badgeColor;
  final IconData metaIcon;
  final String metaLabelKey;

  const SearchResultData({
    required this.id,
    required this.type,
    this.imageUrl,
    required this.titleBeforeHighlight,
    required this.highlightedTerm,
    this.titleAfterHighlight = '',
    required this.badgeLabelKey,
    required this.badgeColor,
    required this.metaIcon,
    required this.metaLabelKey,
  });
}

class SearchMockData {
  static const filterChips = [
    FilterChipData(filter: SearchFilter.all, labelKey: LocaleKeys.searchFilterAll),
    FilterChipData(filter: SearchFilter.team, labelKey: LocaleKeys.searchFilterTeam),
    FilterChipData(filter: SearchFilter.player, labelKey: LocaleKeys.searchFilterPlayer),
    FilterChipData(filter: SearchFilter.tour, labelKey: LocaleKeys.searchFilterTour),
  ];

  static List<SearchResultData> results(String highlightTerm) => [
    SearchResultData(
      id: 'result-1',
      type: SearchFilter.team,
      imageUrl: 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      titleBeforeHighlight: LocaleKeys.searchResult1Prefix.tr(),
      highlightedTerm: highlightTerm,
      badgeLabelKey: LocaleKeys.searchBadgeTeam,
      badgeColor: AppColors.primaryLight,
      metaIcon: FontAwesomeIcons.locationDot,
      metaLabelKey: LocaleKeys.searchResult1Location,
    ),
    SearchResultData(
      id: 'result-2',
      type: SearchFilter.player,
      imageUrl: 'https://i.pravatar.cc/150?img=11',
      titleBeforeHighlight: LocaleKeys.searchResult2Prefix.tr(),
      highlightedTerm: highlightTerm,
      badgeLabelKey: LocaleKeys.searchBadgePlayer,
      badgeColor: AppColors.purple,
      metaIcon: FontAwesomeIcons.star,
      metaLabelKey: LocaleKeys.searchResult2Rating,
    ),
    SearchResultData(
      id: 'result-3',
      type: SearchFilter.tour,
      imageUrl: null,
      titleBeforeHighlight: LocaleKeys.searchResult3Prefix.tr(),
      highlightedTerm: highlightTerm,
      titleAfterHighlight: LocaleKeys.searchResult3Suffix.tr(),
      badgeLabelKey: LocaleKeys.searchBadgeTour,
      badgeColor: AppColors.warning,
      metaIcon: FontAwesomeIcons.users,
      metaLabelKey: LocaleKeys.searchResult3Teams,
    ),
  ];
}