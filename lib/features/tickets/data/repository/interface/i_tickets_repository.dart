import 'package:async/async.dart';
import 'package:dawri/features/tickets/data/models/tickets_model.dart';

abstract class ITicketsRepository {
  Future<Result<List<UpcomingMatchModel>>> getUpcomingMatches();
  Future<Result<List<MyTicketModel>>> getMyTickets();
  Future<Result<String>> bookTickets({required int matchId, required int quantity});
}