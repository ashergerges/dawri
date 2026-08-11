import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/reserve/data/models/reserve_now_model.dart';
import 'package:dawri/features/reserve/data/repositories/interfaces/i_reserve_repository.dart';
import 'package:dawri/features/stadium_profile/data/models/stadium_profile_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IReserveRepository)
class ReserveRepository implements IReserveRepository {
  final NetworkService networkService;

  ReserveRepository({required this.networkService});

  // booking_type is fixed at 1 for now.
  static const int _bookingType = 1;

  @override
  Future<Result<StadiumDetailsModel>> getStadiumDetails(int stadiumId) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.stadiumDetailsUrl,
      queryParameters: {'stadium_id': stadiumId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final stadium = data is Map ? (data['stadium'] ?? data) : data;
      return Result.value(
        StadiumDetailsModel.fromJson(Map<String, dynamic>.from(stadium)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<BookingDurationModel>>> getBookingDurations() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.bookingDurationsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list =
          (data is Map ? data['durations'] : data) as List? ?? const [];
      return Result.value(
        list
            .map((e) => BookingDurationModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<BookingSlotModel>>> getSlots({
    required int stadiumId,
    required String date,
    required int durationMinutes,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.stadiumSlotsUrl,
      queryParameters: {
        'stadium_id': stadiumId,
        'date': date,
        'duration_minutes': durationMinutes,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? data['slots'] : data) as List? ?? const [];
      return Result.value(
        list
            .map((e) => BookingSlotModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> createBooking({
    required int stadiumId,
    required String bookingDate,
    required String startTime,
    required int durationMinutes,
  }) async {
    final response = await networkService.postMultiPartFormDataAsync(
      url: AppStrings.urls.bookingsUrl,
      formMap: {
        'stadium_id': stadiumId,
        'booking_date': bookingDate,
        'start_time': startTime,
        'duration_minutes': durationMinutes,
        'booking_type': _bookingType,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
