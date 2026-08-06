import 'package:async/async.dart';
import 'package:dawri/features/booking_history/data/models/booking_history_model.dart';

abstract class IBookingHistoryRepository {
  /// [status] is [BookingStatus.upcoming] (1) or [BookingStatus.past] (2).
  Future<Result<List<BookingData>>> getBookings({
    required int status,
    required int page,
    int limit = 10,
  });

  Future<Result<String>> cancelBooking({required int bookingId});
}
