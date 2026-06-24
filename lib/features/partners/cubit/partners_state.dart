part of 'partners_cubit.dart';

@freezed
abstract class PartnersState with _$PartnersState {
  const factory PartnersState({
    @Default(ParticipantTab.players) ParticipantTab selectedTab,
    @Default('') String searchQuery,
  }) = _PartnersState;
}