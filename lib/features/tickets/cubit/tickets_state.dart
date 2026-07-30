part of 'tickets_cubit.dart';

@freezed
abstract class TicketsState with _$TicketsState {
  const factory TicketsState({
    @Default(0) int selectedTabIndex,

    // ─── Upcoming matches (tab 0) ────────────────────────────
    @Default([]) List<UpcomingMatchModel> upcomingMatches,
    @Default(TicketsStatus.initial()) TicketsStatus upcomingStatus,

    // ─── My tickets (tab 1) ──────────────────────────────────
    @Default([]) List<MyTicketModel> myTickets,
    @Default(TicketsStatus.initial()) TicketsStatus myTicketsStatus,

    // ─── Booking quantity flow ───────────────────────────────
    UpcomingMatchModel? selectedMatchForBooking,
    @Default(1) int selectedQuantity,
    @Default(TicketsStatus.initial()) TicketsStatus bookingStatus,

    // ─── Success modal ───────────────────────────────────────
    @Default(false) bool showSuccessModal,
    UpcomingMatchModel? lastBookedMatch,
  }) = _TicketsState;
}

@freezed
class TicketsStatus with _$TicketsStatus {
  const factory TicketsStatus.initial() = Initial;
  const factory TicketsStatus.loading() = Loading;
  const factory TicketsStatus.error() = Error;
  const factory TicketsStatus.success() = Success;
}