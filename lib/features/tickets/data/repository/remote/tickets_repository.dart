// lib/features/store/data/repository/tickets_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/tickets/data/models/tickets_model.dart';
import 'package:dawri/features/tickets/data/repository/interface/i_tickets_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
@Injectable(as: ITicketsRepository)
class TicketsRepository implements ITicketsRepository {
  final NetworkService networkService;

  TicketsRepository({required this.networkService});

  @override
  Future<Result<List<UpcomingMatchModel>>> getUpcomingMatches() async {
    final response = await networkService.getAsync(url: AppStrings.urls.matchesTicketsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => UpcomingMatchModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<List<MyTicketModel>>> getMyTickets() async {
    final response = await networkService.getAsync(url: AppStrings.urls.myTicketsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => MyTicketModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<String>> bookTickets({required int matchId, required int quantity}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.matchesTicketsUrl,
      body: {'match_id': matchId, 'quantity': quantity},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}