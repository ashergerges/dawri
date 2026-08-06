part of 'booking_history_cubit.dart';

@freezed
abstract class BookingHistoryState with _$BookingHistoryState {
  const factory BookingHistoryState({
    @Default(BookingTab.upcoming) BookingTab selectedTab,

    // Each tab is its own server query (status=1 / status=2), so the lists,
    // paging and load state are tracked separately.
    @Default([]) List<BookingData> upcoming,
    @Default([]) List<BookingData> past,
    @Default(BookingHistoryStatus.initial()) BookingHistoryStatus upcomingStatus,
    @Default(BookingHistoryStatus.initial()) BookingHistoryStatus pastStatus,
    @Default(1) int upcomingPage,
    @Default(1) int pastPage,

    /// Cancellations in flight, by booking id.
    @Default(<int>{}) Set<int> cancellingIds,
  }) = _BookingHistoryState;

  const BookingHistoryState._();

  bool get isUpcomingTab => selectedTab == BookingTab.upcoming;

  List<BookingData> get items => isUpcomingTab ? upcoming : past;

  BookingHistoryStatus get status => isUpcomingTab ? upcomingStatus : pastStatus;

  int get page => isUpcomingTab ? upcomingPage : pastPage;

  bool get isLoading => status is BookingHistoryStatusLoading;

  bool get hasError => status is BookingHistoryStatusError;
}

@freezed
class BookingHistoryStatus with _$BookingHistoryStatus {
  const factory BookingHistoryStatus.initial() = BookingHistoryStatusInitial;
  const factory BookingHistoryStatus.loading() = BookingHistoryStatusLoading;
  const factory BookingHistoryStatus.success() = BookingHistoryStatusSuccess;
  const factory BookingHistoryStatus.error() = BookingHistoryStatusError;
}
