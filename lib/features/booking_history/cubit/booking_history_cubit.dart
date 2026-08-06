// lib/features/booking_history/cubit/booking_history_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/booking_history/data/models/booking_history_model.dart';
import 'package:dawri/features/booking_history/data/repositories/interfaces/i_booking_history_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'booking_history_state.dart';
part 'booking_history_cubit.freezed.dart';

enum BookingTab { upcoming, past }

class BookingHistoryCubit extends Cubit<BookingHistoryState> {
  BookingHistoryCubit()
      : _repository = getIt<IBookingHistoryRepository>(),
        super(const BookingHistoryState());

  final IBookingHistoryRepository _repository;
  final RefreshController refreshController = RefreshController();

  static const int _limit = 10;

  int get _statusParam =>
      state.isUpcomingTab ? BookingStatus.upcoming : BookingStatus.past;

  // ─── Tabs ──────────────────────────────────────────────────────────────────
  void selectTab(BookingTab tab) {
    if (state.selectedTab == tab) return;
    emit(state.copyWith(selectedTab: tab));

    // Each tab fetches once; pull-to-refresh reloads it afterwards.
    if (state.items.isEmpty && state.status is! BookingHistoryStatusLoading) {
      getBookings();
    }
  }

  // ─── List ──────────────────────────────────────────────────────────────────
  Future<void> getBookings() async {
    final isUpcoming = state.isUpcomingTab;
    emit(_withStatus(const BookingHistoryStatus.loading(), isUpcoming));

    final result = await _repository.getBookings(
      status: _statusParam,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(_withStatus(const BookingHistoryStatus.error(), isUpcoming));
      refreshController.refreshFailed();
      return;
    }

    final items = result.asValue!.value;
    emit(isUpcoming
        ? state.copyWith(
            upcomingStatus: const BookingHistoryStatus.success(),
            upcoming: items,
            upcomingPage: 1,
          )
        : state.copyWith(
            pastStatus: const BookingHistoryStatus.success(),
            past: items,
            pastPage: 1,
          ));
    refreshController.refreshCompleted();
    refreshController.resetNoData();
  }

  Future<void> loadMore() async {
    final isUpcoming = state.isUpcomingTab;
    if (state.items.length < _limit) {
      refreshController.loadNoData();
      return;
    }

    final nextPage = state.page + 1;
    final result = await _repository.getBookings(
      status: _statusParam,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      refreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;
    if (newItems.isEmpty) {
      refreshController.loadNoData();
      return;
    }

    emit(isUpcoming
        ? state.copyWith(
            upcoming: [...state.upcoming, ...newItems],
            upcomingPage: nextPage,
          )
        : state.copyWith(
            past: [...state.past, ...newItems],
            pastPage: nextPage,
          ));

    newItems.length < _limit
        ? refreshController.loadNoData()
        : refreshController.loadComplete();
  }

  // ─── Cancel ────────────────────────────────────────────────────────────────
  Future<void> cancelBooking(int bookingId) async {
    if (state.cancellingIds.contains(bookingId)) return;

    final booking =
        state.upcoming.where((b) => b.bookingId == bookingId).firstOrNull;
    if (booking == null || !booking.canCancel) return;

    emit(state.copyWith(cancellingIds: {...state.cancellingIds, bookingId}));

    final result = await _repository.cancelBooking(bookingId: bookingId);
    final pending = {...state.cancellingIds}..remove(bookingId);

    if (result.isError) {
      emit(state.copyWith(cancellingIds: pending));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    // Cancelled bookings drop out of the upcoming list.
    emit(state.copyWith(
      cancellingIds: pending,
      upcoming: state.upcoming.where((b) => b.bookingId != bookingId).toList(),
    ));

    final message = result.asValue!.value;
    MessageService.showToast(
      msg: message.isNotEmpty ? message : LocaleKeys.cancelSuccess.tr(),
      state: ToastStates.success,
    );
  }

  BookingHistoryState _withStatus(BookingHistoryStatus status, bool isUpcoming) =>
      isUpcoming
          ? state.copyWith(upcomingStatus: status)
          : state.copyWith(pastStatus: status);

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
