// lib/features/product_details/cubit/product_details_state.dart
part of 'product_details_cubit.dart';


@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    @Default(ProductDetailsStateStatus.initial()) ProductDetailsStateStatus currState,
    ProductDetailsModel? product,
    @Default(null) int? selectedSizeId,
    @Default(null) int? selectedColorId,
    @Default(false) bool isWishlisted,
    @Default(false) bool isWishlistLoading,
    @Default(false) bool isAddingToCart,
    @Default(false) bool addedToCart,
  }) = _ProductDetailsState;
}
@freezed
class ProductDetailsStateStatus with _$ProductDetailsStateStatus {
  const factory ProductDetailsStateStatus.initial() = PDInitial;
  const factory ProductDetailsStateStatus.loading() = PDLoading;
  const factory ProductDetailsStateStatus.error() = PDError;
  const factory ProductDetailsStateStatus.success() = PDSuccess;
}
