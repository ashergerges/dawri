// lib/features/product_details/cubit/product_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/product_details/data/models/product_details_model.dart';

part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(const ProductDetailsState());

  void selectSize(int index) {
    emit(state.copyWith(selectedSizeIndex: index));
  }

  void toggleWishlist() {
    emit(state.copyWith(isWishlisted: !state.isWishlisted));
  }

  void addToCart() {
    emit(state.copyWith(addedToCart: true));
  }
}