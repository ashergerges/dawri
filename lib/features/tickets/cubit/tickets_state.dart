part of 'tickets_cubit.dart';

@freezed
abstract class TicketsState with _$TicketsState {
  const factory TicketsState({
    @Default(0) int selectedTabIndex,
    @Default(false) bool showSuccessModal,
    @Default(null) UpcomingMatchModel? lastBookedMatch,
  }) = _TicketsState;
}