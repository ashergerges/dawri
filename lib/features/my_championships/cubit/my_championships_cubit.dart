// lib/features/my_championships/cubit/my_championships_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_championships_state.dart';
part 'my_championships_cubit.freezed.dart';

class MyChampionshipsCubit extends Cubit<MyChampionshipsState> {
  MyChampionshipsCubit() : super(const MyChampionshipsState());

  void selectTab(int index) => emit(state.copyWith(selectedTabIndex: index));
}