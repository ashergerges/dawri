// lib/features/cart/cubit/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/cart/data/repositories/interfaces/i_cart_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/cart/data/models/cart_model.dart';

import '../../../main_common.dart' show getIt;

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';


const _taxRate = 0.15;

class CartCubit extends Cubit<CartState> {
  CartCubit({ICartRepository? cartRepo})
      : _cartRepo = cartRepo ?? getIt<ICartRepository>(),
        super(const CartState()) {
    getCart();
  }

  final ICartRepository _cartRepo;

  double get subTotal =>
      state.apiCartTotal?.toDouble() ??
          state.items.fold(0, (sum, item) => sum + (item.subTotal ?? 0));

  double get tax => subTotal * _taxRate;

  double get finalTotal {
    if (state.isCouponApplied && state.apiFinalTotal != null) {
      return state.apiFinalTotal!.toDouble();
    }
    return subTotal + tax - state.discountAmount;
  }

  // ─── LOAD ───────────────────────────────────────────────────────────────
  Future<void> getCart() async {
    emit(state.copyWith(currState: const CartStateStatus.loading()));

    final result = await _cartRepo.getCart();

    if (result.isError) {
      emit(state.copyWith(currState: const CartStateStatus.error()));
      return;
    }

    emit(state.copyWith(
      currState: const CartStateStatus.success(),
      items: result.asValue?.value.cartItems ?? [],
    ));
  }

  // ─── QUANTITY ───────────────────────────────────────────────────────────
  /// Returns true if this action should remove the item (quantity would hit 0),
  /// so the UI can show a confirmation dialog before calling [removeItem].
  bool willRemoveOnDecrease(int cartItemId) {
    final item = state.items.firstWhere((e) => e.id == cartItemId);
    return (item.quantity ?? 1) <= 1;
  }

  Future<void> increaseQuantity(int cartItemId) async {
    final index = state.items.indexWhere((item) => item.id == cartItemId);
    if (index == -1) return;
    final newQty = (state.items[index].quantity ?? 1) + 1;
    await _updateQuantity(index, newQty);
  }

  Future<void> decreaseQuantity(int cartItemId) async {
    final index = state.items.indexWhere((item) => item.id == cartItemId);
    if (index == -1) return;
    final current = state.items[index].quantity ?? 1;
    if (current <= 1) return; // UI should route to removeItem via confirmation instead
    await _updateQuantity(index, current - 1);
  }

  Future<void> _updateQuantity(int index, int quantity) async {
    final updated = List<CartItemModel>.from(state.items);
    final item = updated[index];
    final unitPrice = item.variant?.price ?? 0;
    updated[index] = CartItemModel(
      id: item.id,
      quantity: quantity,
      subTotal: unitPrice * quantity,
      productName: item.productName,
      productImage: item.productImage,
      variant: item.variant,
    );
    emit(state.copyWith(items: updated));

    if (item.id != null) {
      final result = await _cartRepo.updateQuantity(cartItemId: item.id!, quantity: quantity);
      if (result.isError) {
        // rollback on failure
        emit(state.copyWith(items: state.items));
        getCart();
      }
    }
  }

  // ─── DELETE ─────────────────────────────────────────────────────────────
  Future<void> removeItem(int cartItemId) async {
    final previous = state.items;
    emit(state.copyWith(items: previous.where((item) => item.id != cartItemId).toList()));

    final result = await _cartRepo.deleteCart(cartItemId: cartItemId, deleteAll: false);
    if (result.isError) {
      emit(state.copyWith(items: previous));
    }
  }

  Future<void> deleteAll() async {
    final previous = state.items;
    emit(state.copyWith(items: []));

    final result = await _cartRepo.deleteCart(deleteAll: true);
    if (result.isError) {
      emit(state.copyWith(items: previous));
    } else {
      removeCoupon();
    }
  }

  // ─── COUPON ─────────────────────────────────────────────────────────────
  Future<void> applyCoupon(String code) async {
    if (code.trim().isEmpty || state.isCouponLoading || state.isCouponApplied) return;

    emit(state.copyWith(isCouponLoading: true, couponErrorKey: null));

    final result = await _cartRepo.applyCoupon(code: code.trim());

    if (result.isError) {
      emit(state.copyWith(isCouponLoading: false, couponErrorKey: LocaleKeys.errorGeneric));
      return;
    }

    final data = result.asValue?.value;
    emit(state.copyWith(
      isCouponLoading: false,
      isCouponApplied: true,
      appliedCouponCode: data?.couponCode,
      couponPercentage: data?.percentage,
      discountAmount: data?.discountAmount ?? 0,
      apiCartTotal: data?.cartTotal,
      apiFinalTotal: data?.finalTotal,
    ));
  }

  void removeCoupon() {
    emit(state.copyWith(
      isCouponApplied: false,
      appliedCouponCode: null,
      couponPercentage: null,
      discountAmount: 0,
      apiCartTotal: null,
      apiFinalTotal: null,
      couponErrorKey: null,
    ));
  }

  // ─── CHECKOUT ───────────────────────────────────────────────────────────
  Future<void> checkout() async {
    if (state.items.isEmpty) return;
    emit(state.copyWith(isCheckoutLoading: true));
    // TODO: replace with real checkout endpoint
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isCheckoutLoading: false, isCheckoutSuccess: true));
  }
}