// lib/features/help_center/cubit/help_center_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
import 'package:dawri/features/help_center/data/models/help_center_model.dart';
import 'package:dawri/features/help_center/data/repositories/interfaces/i_help_center_repository.dart';
import 'package:dawri/features/splash/data/models/settings_model.dart';
import 'package:dawri/features/splash/data/repositories/interfaces/i_splash_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_center_state.dart';
part 'help_center_cubit.freezed.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit()
      : _repository = getIt<IHelpCenterRepository>(),
        // The contact channels live on `api/app/support-data`, which the splash
        // repository already fetches and parses — reused rather than duplicated.
        _splashRepository = getIt<ISplashRepository>(),
        super(const HelpCenterState());

  final IHelpCenterRepository _repository;
  final ISplashRepository _splashRepository;

  Future<void> init() => Future.wait([getContent(), getSupport()]);

  // ─── Content (categories + FAQs) ───────────────────────────────────────────
  Future<void> getContent() async {
    emit(state.copyWith(contentStatus: const HelpStatus.loading()));

    // Kicked off together, awaited separately — parallel without losing types.
    final categoriesFuture = _repository.getCategories();
    final faqsFuture = _repository.getFaqs();
    final categoriesResult = await categoriesFuture;
    final faqsResult = await faqsFuture;

    // Either call failing falls back to the bundled copy, so the screen is
    // never empty — the user still gets answers offline.
    if (categoriesResult.isError || faqsResult.isError) {
      emit(state.copyWith(
        categories: HelpCenterFallbackData.categories(),
        faqs: HelpCenterFallbackData.faqs(),
        isFallbackContent: true,
        contentStatus: const HelpStatus.success(),
      ));
      return;
    }

    final categories = categoriesResult.asValue!.value;
    final faqs = faqsResult.asValue!.value;

    // An empty server response is also worth falling back on.
    if (faqs.isEmpty) {
      emit(state.copyWith(
        categories: HelpCenterFallbackData.categories(),
        faqs: HelpCenterFallbackData.faqs(),
        isFallbackContent: true,
        contentStatus: const HelpStatus.success(),
      ));
      return;
    }

    emit(state.copyWith(
      categories: categories,
      faqs: faqs,
      isFallbackContent: false,
      contentStatus: const HelpStatus.success(),
      // A category that no longer exists must not keep filtering the list.
      selectedCategoryId: categories.any((c) => c.id == state.selectedCategoryId)
          ? state.selectedCategoryId
          : null,
    ));
  }

  // ─── Support contact channels ──────────────────────────────────────────────
  Future<void> getSupport() async {
    emit(state.copyWith(supportStatus: const HelpStatus.loading()));

    final result = await _splashRepository.support();

    if (result.isError) {
      emit(state.copyWith(supportStatus: const HelpStatus.error()));
      return;
    }

    emit(state.copyWith(
      support: result.asValue!.value,
      supportStatus: const HelpStatus.success(),
    ));
  }

  // ─── Search / filter / accordion ───────────────────────────────────────────
  void updateSearch(String value) {
    // Collapse any open answer so the accordion can't keep stale state when the
    // item it belongs to gets filtered out.
    emit(state.copyWith(searchQuery: value, openFaqId: null));
  }

  void clearSearch() => emit(state.copyWith(searchQuery: '', openFaqId: null));

  /// Tapping the selected category clears the filter.
  void selectCategory(int? categoryId) {
    final next = state.selectedCategoryId == categoryId ? null : categoryId;
    emit(state.copyWith(selectedCategoryId: next, openFaqId: null));
  }

  void toggleFaq(String id) {
    emit(state.copyWith(openFaqId: state.openFaqId == id ? null : id));
  }

  // ─── Contact actions ───────────────────────────────────────────────────────
  Future<void> openWhatsApp() => _launch(() {
        final link = state.whatsappLink!;
        // Accept either a full wa.me URL or a bare number from the backend.
        return link.startsWith('http')
            ? UrlLauncher.openWebInApp(link)
            : UrlLauncher.shareToWhatsApp(link);
      });

  Future<void> callSupport() =>
      _launch(() => UrlLauncher.makePhoneCall(state.phone!));

  Future<void> openSocial(String url) =>
      _launch(() => UrlLauncher.openWebInApp(url));

  /// UrlLauncher throws when no app can handle the scheme; surface that instead
  /// of letting it bubble up as an unhandled async error.
  Future<void> _launch(Future<void> Function() action) async {
    try {
      await action();
    } catch (_) {
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
    }
  }
}
