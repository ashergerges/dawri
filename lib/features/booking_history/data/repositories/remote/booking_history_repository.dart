import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/booking_history/data/models/booking_history_model.dart';
import 'package:dawri/features/booking_history/data/repositories/interfaces/i_booking_history_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IBookingHistoryRepository)
class BookingHistoryRepository implements IBookingHistoryRepository {
  final NetworkService networkService;

  BookingHistoryRepository({required this.networkService});

  @override
  Future<Result<List<BookingData>>> getBookings({
    required int status,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.myBookingsUrl,
      queryParameters: {'status': status, 'page': page, 'limit': limit},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      // The list arrives either directly or wrapped (items/bookings).
      final items = data is List
          ? data
          : (data?['items'] ?? data?['bookings'] ?? data?['data']) as List? ?? [];

      return Result.value(
        items
            .map((e) => BookingData.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> cancelBooking({required int bookingId}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.myBookingsCancelUrl,
      body: {'booking_id': bookingId},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
