// lib/features/help_center/cubit/help_center_state.dart
part of 'help_center_cubit.dart';

@freezed
abstract class HelpCenterState with _$HelpCenterState {
  const factory HelpCenterState({
    // ─── Search / accordion (UI-local) ───────────────────────────
    @Default('') String searchQuery,
    String? openFaqId,
    int? selectedCategoryId,

    // ─── Help content (categories + FAQs) ────────────────────────
    @Default([]) List<FaqCategoryModel> categories,
    @Default([]) List<FaqModel> faqs,
    @Default(HelpStatus.initial()) HelpStatus contentStatus,

    /// True when the API failed and the bundled copy is on screen instead.
    @Default(false) bool isFallbackContent,

    // ─── Support contact channels ────────────────────────────────
    SettingsModel? support,
    @Default(HelpStatus.initial()) HelpStatus supportStatus,
  }) = _HelpCenterState;

  const HelpCenterState._();

  bool get isContentLoading => contentStatus is HelpStatusLoading;
  bool get hasContentError => contentStatus is HelpStatusError;
  bool get isSupportLoading => supportStatus is HelpStatusLoading;

  /// FAQs after the category filter and the search query are both applied.
  List<FaqModel> get visibleFaqs => faqs
      .where((f) =>
          (selectedCategoryId == null || f.categoryId == selectedCategoryId) &&
          f.matches(searchQuery))
      .toList();

  bool get isSearching => searchQuery.trim().isNotEmpty;

  /// Categories are hidden while searching so results stay in view.
  bool get showCategories => !isSearching && categories.isNotEmpty;

  String? get phone => (support?.phone ?? '').trim().isEmpty
      ? null
      : support!.phone!.trim();

  String? get whatsappLink => (support?.whatsappLink ?? '').trim().isEmpty
      ? null
      : support!.whatsappLink!.trim();

  bool get hasAnyContactChannel => phone != null || whatsappLink != null;

  /// Social links that came back non-empty, paired with their icon.
  List<({IconData icon, String url})> get socialLinks => [
        (icon: FontAwesomeIcons.xTwitter, url: support?.twitterLink ?? ''),
        (icon: FontAwesomeIcons.instagram, url: support?.instagramLink ?? ''),
        (icon: FontAwesomeIcons.snapchat, url: support?.snapchatLink ?? ''),
        (icon: FontAwesomeIcons.tiktok, url: support?.tiktokLink ?? ''),
      ].where((e) => e.url.trim().isNotEmpty).toList();
}

@freezed
class HelpStatus with _$HelpStatus {
  const factory HelpStatus.initial() = HelpStatusInitial;
  const factory HelpStatus.loading() = HelpStatusLoading;
  const factory HelpStatus.success() = HelpStatusSuccess;
  const factory HelpStatus.error() = HelpStatusError;
}
