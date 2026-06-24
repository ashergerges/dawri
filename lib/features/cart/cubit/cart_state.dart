part of 'cart_cubit.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(CartMockData.initialItems) List<CartItemModel> items,
    @Default(0) double discount,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _CartState;
}