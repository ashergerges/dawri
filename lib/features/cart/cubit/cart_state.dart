// lib/features/cart/cubit/cart_state.dart
part of 'cart_cubit.dart';




@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(CartStateStatus.initial()) CartStateStatus currState,
    @Default([]) List<CartItemModel> items,
    @Default(false) bool isCheckoutLoading,
    @Default(false) bool isCheckoutSuccess,

    // ── Coupon ──
    @Default(false) bool isCouponLoading,
    @Default(false) bool isCouponApplied,
    @Default(null) String? appliedCouponCode,
    @Default(null) String? couponPercentage,
    @Default(0) num discountAmount,
    @Default(null) num? apiCartTotal,
    @Default(null) num? apiFinalTotal,
    @Default(null) String? couponErrorKey,
  }) = _CartState;
}
@freezed
class CartStateStatus with _$CartStateStatus {
  const factory CartStateStatus.initial() = CartInitial;
  const factory CartStateStatus.loading() = CartLoading;
  const factory CartStateStatus.error() = CartError;
  const factory CartStateStatus.success() = CartSuccess;
}
