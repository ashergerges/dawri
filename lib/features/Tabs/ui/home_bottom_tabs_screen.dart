import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/features/Tabs/cubit/tab_bar_cubit.dart';
import 'package:dawri/features/Tabs/ui/bottom_nav.dart';

@RoutePage()
class HomeBottomTabsScreen extends StatelessWidget {
  final int index;

  const HomeBottomTabsScreen({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabBarCubit()..selectScreen(index: index),
      child: BlocBuilder<TabBarCubit, TabBarState>(
        builder: (context, state) {
          return PopScope(
            canPop: state.activeScreen == 0,
            onPopInvokedWithResult: (didPop, result) async {
              if (state.activeScreen != 0) {
                context.read<TabBarCubit>().selectScreen(index: 0);
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.background,
              body: context.read<TabBarCubit>().navScreens[state.activeScreen],
              bottomNavigationBar: NavigationBarItems(
                onTap: (i) => context.read<TabBarCubit>().selectScreen(index: i),
                activeScreen: state.activeScreen,
              ),
            ),
          );
        },
      ),
    );
  }
}
