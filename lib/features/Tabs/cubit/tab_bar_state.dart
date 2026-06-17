part of 'tab_bar_cubit.dart';

@freezed
abstract class TabBarState with _$TabBarState {
  const factory TabBarState.tabBarIndex({@Default(0) int activeScreen}) = TabBarIndex;
}
