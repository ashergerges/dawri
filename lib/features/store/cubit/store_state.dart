// lib/features/store/cubit/store_state.dart
part of 'store_cubit.dart';

@freezed
abstract class StoreState with _$StoreState {
  const factory StoreState({
    @Default(0) int cartCount,
    required RefreshController refreshController,
    @Default(false) bool isCategoriesLoading,
    @Default([]) List<CategoryModel> categories,
    @Default(null) int? selectedCategoryId,
    @Default('') String search,
    @Default(true) bool isProductsLoading,
    @Default([]) List<ProductModel> products,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    @Default(null) String? generalErrorKey,
  }) = _StoreState;
}