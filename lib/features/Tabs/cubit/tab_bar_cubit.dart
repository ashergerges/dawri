import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/home/ui/home_screen.dart';
import 'package:flutter/cupertino.dart';

part 'tab_bar_state.dart';
part 'tab_bar_cubit.freezed.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState.tabBarIndex());

  List<Widget> get navScreens => [
    const HomeScreen(),
    const HomeScreen(), // Tournaments - placeholder
    const HomeScreen(), // Stadiums - placeholder
    const HomeScreen(), // Store - placeholder
    const HomeScreen(), // Account - placeholder
  ];

  void selectScreen({required int index}) {
    emit(state.copyWith(activeScreen: index));
  }
}
