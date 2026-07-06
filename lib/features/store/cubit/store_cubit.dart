// lib/features/store/cubit/store_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/features/store/data/models/store_model.dart';
import 'package:dawri/features/store/data/repository/interface/i_store_repository.dart';

import '../../../main_common.dart' show getIt;

part 'store_state.dart';
part 'store_cubit.freezed.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit({IStoreRepository? storeRepo})
      : _storeRepo = storeRepo ?? getIt<IStoreRepository>(),
        super(StoreState(refreshController: RefreshController())) {
    getCategories();
    getProducts();
  }

  final IStoreRepository _storeRepo;
  Timer? _searchDebounce;

  Future<void> addToCart({required int id}) async {

    final result = await _storeRepo.addedToCart(id: id);
    if (result.isError) {
      return;
    }

    MessageService.showToast(msg: result.asValue?.value??"", state: ToastStates.success);
    emit(state.copyWith(cartCount: state.cartCount + 1));
  }

  // ─── CATEGORIES ───────────────────────────────────────────────────────────
  Future<void> getCategories() async {
    emit(state.copyWith(isCategoriesLoading: true));

    final result = await _storeRepo.getCategories();

    if (result.isError) {
      emit(state.copyWith(isCategoriesLoading: false, generalErrorKey: LocaleKeys.errorGeneric));
      return;
    }

    emit(state.copyWith(
      isCategoriesLoading: false,
      categories: result.asValue?.value.categories ?? [],
    ));
  }

  void selectCategory(int? categoryId) {
    if (state.selectedCategoryId == categoryId) return;
    emit(state.copyWith(selectedCategoryId: categoryId));
    getProducts();
  }

  // ─── SEARCH ───────────────────────────────────────────────────────────────
  void updateSearch(String value) {
    emit(state.copyWith(search: value));
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () => getProducts());
  }

  // ─── PRODUCTS (first load / refresh) ───────────────────────────────────────
  Future<void> getProducts({bool isPull = false}) async {
    if (!isPull) emit(state.copyWith(isProductsLoading: true, generalErrorKey: null));

    final result = await _storeRepo.getProducts(
      search: state.search.trim().isEmpty ? null : state.search.trim(),
      categoryId: state.selectedCategoryId,
      page: 1,
    );

    if (result.isError) {
      emit(state.copyWith(isProductsLoading: false, generalErrorKey: LocaleKeys.errorGeneric));
      if (isPull) state.refreshController.refreshFailed();
      return;
    }

    final data = result.asValue?.value;
    final pagination = data?.pagination;

    emit(state.copyWith(
      isProductsLoading: false,
      products: data?.products ?? [],
      currentPage: 1,
      hasMore: (pagination?.currentPage ?? 1) < (pagination?.totalPages ?? 1),
    ));

    if (isPull) state.refreshController.refreshCompleted();
  }

  // ─── PRODUCTS (load more) ───────────────────────────────────────────────────
  Future<void> getProductsMore() async {
    if (!state.hasMore) {
      state.refreshController.loadNoData();
      return;
    }

    final nextPage = state.currentPage + 1;

    final result = await _storeRepo.getProducts(
      search: state.search.trim().isEmpty ? null : state.search.trim(),
      categoryId: state.selectedCategoryId,
      page: nextPage,
    );

    if (result.isError) {
      state.refreshController.loadFailed();
      return;
    }

    final data = result.asValue?.value;
    final pagination = data?.pagination;

    emit(state.copyWith(
      products: [...state.products, ...?data?.products],
      currentPage: nextPage,
      hasMore: (pagination?.currentPage ?? nextPage) < (pagination?.totalPages ?? nextPage),
    ));

    state.refreshController.loadComplete();
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    state.refreshController.dispose();
    return super.close();
  }
}