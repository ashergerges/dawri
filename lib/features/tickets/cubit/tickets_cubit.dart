import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/tickets/data/models/tickets_model.dart';
import 'package:dawri/features/tickets/data/repository/interface/i_tickets_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tickets_state.dart';
part 'tickets_cubit.freezed.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit()
      : _repository = getIt<ITicketsRepository>(),
        super(const TicketsState());

  final ITicketsRepository _repository;

  // ─── Tabs ────────────────────────────────────────────────────────────────
  void selectTab(int index) {
    emit(state.copyWith(selectedTabIndex: index));
    if (index == 0 && state.upcomingMatches.isEmpty) getUpcomingMatches();
    if (index == 1 && state.myTickets.isEmpty) getMyTickets();
  }

  // ─── Upcoming matches ────────────────────────────────────────────────────
  Future<void> getUpcomingMatches() async {
    emit(state.copyWith(upcomingStatus: const TicketsStatus.loading()));

    final result = await _repository.getUpcomingMatches();

    if (result.isError) {
      emit(state.copyWith(upcomingStatus: const TicketsStatus.error()));
      return;
    }

    emit(state.copyWith(
      upcomingStatus: const TicketsStatus.success(),
      upcomingMatches: result.asValue!.value,
    ));
  }

  // ─── My tickets ──────────────────────────────────────────────────────────
  Future<void> getMyTickets() async {
    emit(state.copyWith(myTicketsStatus: const TicketsStatus.loading()));

    final result = await _repository.getMyTickets();

    if (result.isError) {
      emit(state.copyWith(myTicketsStatus: const TicketsStatus.error()));
      return;
    }

    emit(state.copyWith(
      myTicketsStatus: const TicketsStatus.success(),
      myTickets: result.asValue!.value,
    ));
  }

  // ─── Booking flow (quantity selection) ─────────────────────────────────
  /// يفتح اختيار الكمية قبل الحجز الفعلي (هيتنادى من الـ UI عشان يعرض Dialog/Sheet)
  void startBooking(UpcomingMatchModel match) {
    emit(state.copyWith(
      selectedMatchForBooking: match,
      selectedQuantity: 1,
      bookingStatus: const TicketsStatus.initial(),
    ));
  }

  void updateQuantity(int quantity) {
    final match = state.selectedMatchForBooking;
    final maxAvailable = match?.remainingTickets ?? 999;
    if (quantity < 1 || quantity > maxAvailable) return;
    emit(state.copyWith(selectedQuantity: quantity));
  }

  void cancelBooking() {
    emit(state.copyWith(selectedMatchForBooking: null, selectedQuantity: 1));
  }

  Future<void> confirmBooking() async {
    final match = state.selectedMatchForBooking;
    if (match == null || match.id == null) return;

    emit(state.copyWith(bookingStatus: const TicketsStatus.loading()));

    final result = await _repository.bookTickets(
      matchId: match.id!,
      quantity: state.selectedQuantity,
    );

    if (result.isError) {
      emit(state.copyWith(bookingStatus: const TicketsStatus.error()));
      MessageService.showToast(msg: 'Failed to book tickets', state: ToastStates.error);
      return;
    }

    emit(state.copyWith(
      bookingStatus: const TicketsStatus.success(),
      showSuccessModal: true,
      lastBookedMatch: match,
      selectedMatchForBooking: null,
      selectedQuantity: 1,
    ));

    // تحديث القائمتين بعد الحجز الناجح
    getUpcomingMatches();
  }

  void dismissSuccessModal() {
    emit(state.copyWith(showSuccessModal: false));
  }

  /// Closes the modal and switches to the "My Tickets" tab.
  void viewTicketFromModal() {
    emit(state.copyWith(showSuccessModal: false, selectedTabIndex: 1));
    getMyTickets();
  }
}