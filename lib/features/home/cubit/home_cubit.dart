// lib/features/home/cubit/home_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setUserName(String name) {
    emit(state.copyWith(userName: name));
  }

  void setHasNotifications(bool value) {
    emit(state.copyWith(hasNotifications: value));
  }

  void updateSearchQuery(String value) {
    emit(state.copyWith(searchQuery: value));
  }
}