// lib/features/cart/cubit/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/cart/data/models/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  double get subTotal => state.items.fold(0, (sum, item) => sum + item.totalPrice);

  double get tax => subTotal * CartMockData.taxRate;

  double get finalTotal => subTotal + tax - state.discount;

  void increaseQuantity(String itemId) {
    final updated = state.items.map((item) {
      if (item.id != itemId) return item;
      return item.copyWith(quantity: item.quantity + 1);
    }).toList();
    emit(state.copyWith(items: updated));
  }

  void decreaseQuantity(String itemId) {
    final updated = state.items.map((item) {
      if (item.id != itemId) return item;
      final next = item.quantity - 1;
      return item.copyWith(quantity: next < 1 ? 1 : next);
    }).toList();
    emit(state.copyWith(items: updated));
  }

  void removeItem(String itemId) {
    final updated = state.items.where((item) => item.id != itemId).toList();
    emit(state.copyWith(items: updated));
  }

  void clearCart() {
    emit(state.copyWith(items: []));
  }

  void applyPromoCode(String code) {
    // TODO: hook into real promo-code validation/API
    if (code.trim().isEmpty) return;
    emit(state.copyWith(discount: 0));
  }

  Future<void> checkout() async {
    if (state.items.isEmpty) return;
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}