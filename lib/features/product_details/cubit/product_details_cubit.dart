// lib/features/product_details/cubit/product_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/product_details/data/repositories/interfaces/i_product_details_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/product_details/data/models/product_details_model.dart';

import '../../../main_common.dart' show getIt;

part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({required this.productId,})
      : _repo =  getIt<IProductDetailsRepository>(),
        super(const ProductDetailsState()) {
    getProductDetails();
  }

  final int productId;
  final IProductDetailsRepository _repo;

  // ─── UNIQUE SIZES / COLORS ────────────────────────────────────────────────
  List<ProductSizeModel> get sizes {
    final variants = state.product?.variants ?? [];
    final seen = <int>{};
    return variants
        .map((v) => v.size)
        .whereType<ProductSizeModel>()
        .where((s) => s.id != null && seen.add(s.id!))
        .toList();
  }

  /// Colors available for currently selected size
  List<ProductColorModel> get colors {
    final variants = state.product?.variants ?? [];
    final matching = state.selectedSizeId == null
        ? variants
        : variants.where((v) => v.size?.id == state.selectedSizeId);
    final seen = <int>{};
    return matching
        .map((v) => v.color)
        .whereType<ProductColorModel>()
        .where((c) => c.id != null && seen.add(c.id!))
        .toList();
  }

  ProductVariantModel? get selectedVariant {
    final variants = state.product?.variants ?? [];
    try {
      return variants.firstWhere(
            (v) =>
        v.size?.id == state.selectedSizeId &&
            (state.selectedColorId == null || v.color?.id == state.selectedColorId),
      );
    } catch (_) {
      return null;
    }
  }

  // ─── LOAD ───────────────────────────────────────────────────────────────
  Future<void> getProductDetails() async {
    emit(state.copyWith(currState: const ProductDetailsStateStatus.loading()));

    final result = await _repo.getProductDetails(id: productId);

    if (result.isError) {
      emit(state.copyWith(currState: const ProductDetailsStateStatus.error()));
      return;
    }

    final product = result.asValue?.value.product;
    final firstVariant = product?.variants?.isNotEmpty == true ? product!.variants!.first : null;

    emit(state.copyWith(
      currState: const ProductDetailsStateStatus.success(),
      product: product,
      selectedSizeId: firstVariant?.size?.id,
      selectedColorId: firstVariant?.color?.id,
    ));
  }

  // ─── SELECTION ──────────────────────────────────────────────────────────
  void selectSize(int sizeId) {
    if (state.selectedSizeId == sizeId) return;
    // reset color if it doesn't exist for the new size
    final variants = state.product?.variants ?? [];
    final availableColors = variants.where((v) => v.size?.id == sizeId).map((v) => v.color?.id);
    final newColorId = availableColors.contains(state.selectedColorId) ? state.selectedColorId : availableColors.firstOrNull;

    emit(state.copyWith(selectedSizeId: sizeId, selectedColorId: newColorId));
  }

  void selectColor(int colorId) {
    emit(state.copyWith(selectedColorId: colorId));
  }

  // ─── WISHLIST ───────────────────────────────────────────────────────────
  Future<void> toggleWishlist() async {
    if (state.product?.id == null || state.isWishlistLoading) return;

    final previous = state.isWishlisted;
    emit(state.copyWith(isWishlisted: !previous, isWishlistLoading: true));

    final result = await _repo.toggleWishlist(id: state.product!.id!);

    if (result.isError) {
      emit(state.copyWith(isWishlisted: previous, isWishlistLoading: false));
      return;
    }

    emit(state.copyWith(isWishlistLoading: false));
  }

  // ─── CART ───────────────────────────────────────────────────────────────
  Future<void> addToCart() async {
    final variant = selectedVariant;
    if (variant?.id == null || state.isAddingToCart) return;

    emit(state.copyWith(isAddingToCart: true, addedToCart: false));

    final result = await _repo.addToCart(productVariantId: variant!.id!, quantity: 1);

    MessageService.showToast(msg: result.asValue?.value??"", state: result.isError?ToastStates.error:ToastStates.success);

    emit(state.copyWith(
      isAddingToCart: false,
      addedToCart: !result.isError,
    ));
  }
}