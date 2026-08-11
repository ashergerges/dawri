import 'package:async/async.dart';
import 'package:dawri/features/reserve/data/models/reserve_now_model.dart';
import 'package:dawri/features/stadium_profile/data/models/stadium_profile_model.dart';

abstract class IReserveRepository {
  Future<Result<StadiumDetailsModel>> getStadiumDetails(int stadiumId);

  Future<Result<List<BookingDurationModel>>> getBookingDurations();

  Future<Result<List<BookingSlotModel>>> getSlots({
    required int stadiumId,
    required String date,
    required int durationMinutes,
  });

  /// Returns the success message from the response.
  Future<Result<String>> createBooking({
    required int stadiumId,
    required String bookingDate,
    required String startTime,
    required int durationMinutes,
  });
}
