part of 'store_cubit.dart';

@freezed
abstract class StoreState with _$StoreState {
  const factory StoreState({
    @Default(0) int selectedCategoryIndex,
    @Default(0) int cartCount,
  }) = _StoreState;
}