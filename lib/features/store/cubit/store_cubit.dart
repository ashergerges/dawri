// lib/features/store/cubit/store_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_state.dart';
part 'store_cubit.freezed.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(const StoreState());

  void selectCategory(int index) {
    emit(state.copyWith(selectedCategoryIndex: index));
  }

  void addToCart() {
    emit(state.copyWith(cartCount: state.cartCount + 1));
  }
}