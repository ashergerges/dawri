part of 'championships_cubit.dart';

@freezed
abstract class ChampionshipsState with _$ChampionshipsState {
  const factory ChampionshipsState({
  @Default(0) int activeTab
}) = _ChampionshipsState;
}
