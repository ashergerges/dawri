part of 'my_championships_cubit.dart';

@freezed
abstract class MyChampionshipsState with _$MyChampionshipsState {
  const factory MyChampionshipsState({
    @Default(0) int selectedTabIndex,
  }) = _MyChampionshipsState;
}