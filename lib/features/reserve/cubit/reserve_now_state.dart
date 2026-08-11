part of 'reserve_now_cubit.dart';

@freezed
abstract class ReserveNowState with _$ReserveNowState {
  const factory ReserveNowState({
    // ─── Date ────────────────────────────────────────────────
    /// The same week strip the stadiums list shows, so the booking date can be
    /// changed here instead of going back.
    @Default([]) List<DateOption> dates,
    @Default(0) int selectedDateIndex,

    // ─── Stadium details ─────────────────────────────────────
    StadiumDetailsModel? stadium,
    @Default(ReserveStatus.initial()) ReserveStatus stadiumStatus,

    // ─── Durations ───────────────────────────────────────────
    @Default([]) List<BookingDurationModel> durations,
    @Default(ReserveStatus.initial()) ReserveStatus durationsStatus,
    BookingDurationModel? selectedDuration,

    // ─── Slots ───────────────────────────────────────────────
    @Default([]) List<BookingSlotModel> slots,
    @Default(ReserveStatus.initial()) ReserveStatus slotsStatus,
    BookingSlotModel? selectedSlot,

    // ─── Payment (static) ────────────────────────────────────
    @Default(0) int selectedPaymentIndex,

    // ─── Booking submission ──────────────────────────────────
    @Default(ReserveStatus.initial()) ReserveStatus bookingStatus,
    String? bookingMessage,
  }) = _ReserveNowState;

  const ReserveNowState._();

  /// `yyyy-MM-dd` for the day currently selected in the strip.
  String? get selectedApiDate => dates.isEmpty
      ? null
      : dates[selectedDateIndex.clamp(0, dates.length - 1)].apiDate;
}

@freezed
class ReserveStatus with _$ReserveStatus {
  const factory ReserveStatus.initial() = ReserveStatusInitial;
  const factory ReserveStatus.loading() = ReserveStatusLoading;
  const factory ReserveStatus.success() = ReserveStatusSuccess;
  const factory ReserveStatus.error() = ReserveStatusError;
}
