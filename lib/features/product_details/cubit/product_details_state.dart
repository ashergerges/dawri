part of 'product_details_cubit.dart';

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    @Default(ProductDetailsMockData.defaultSizeIndex) int selectedSizeIndex,
    @Default(false) bool isWishlisted,
    @Default(false) bool addedToCart,
  }) = _ProductDetailsState;
}