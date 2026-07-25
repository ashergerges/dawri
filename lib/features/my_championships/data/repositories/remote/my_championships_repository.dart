import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:dawri/features/my_championships/data/models/my_championships_model.dart';
import 'package:dawri/features/my_championships/data/repositories/interfaces/i_my_championships_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMyChampionshipsRepository)
class MyChampionshipsRepository implements IMyChampionshipsRepository {
  final NetworkService networkService;

  MyChampionshipsRepository({required this.networkService});

  @override
  Future<Result<MyChampionshipsStatsModel>> getStats() async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.myChampionshipsStatsUrl,
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = _unwrap(response.asValue!.value.data);
      return Result.value(
        MyChampionshipsStatsModel.fromJson(Map<String, dynamic>.from(data as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<MyChampionshipParticipationModel>>> getParticipations({
    required int tab,
    required int page,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.myChampionshipsUrl,
      queryParameters: {'tab': tab, 'page': page},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final items = _items(response.asValue!.value.data);
      return Result.value(
        items
            .map((e) => MyChampionshipParticipationModel.fromJson(
                Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<MyChampionshipOrganizedModel>>> getOrganized({
    required int page,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.myChampionshipsUrl,
      queryParameters: {'tab': 2, 'page': page},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final items = _items(response.asValue!.value.data);
      return Result.value(
        items
            .map((e) => MyChampionshipOrganizedModel.fromJson(
                Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<MatchGroupModel>>> getMatches({
    required int championshipId,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipMatchesUrl,
      queryParameters: {'championship_id': championshipId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = _unwrap(response.asValue!.value.data);
      final list = data is List ? data : const [];
      return Result.value(
        list
            .map((e) => MatchGroupModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<MyTeamModel?>> getMyTeam({required int championshipId}) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipMyTeamUrl,
      queryParameters: {'championship_id': championshipId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = _unwrap(response.asValue!.value.data);
      if (data == null) return Result.value(null);
      return Result.value(
        MyTeamModel.fromJson(Map<String, dynamic>.from(data as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  /// Returns the payload under the `data` key (falls back to the raw body).
  dynamic _unwrap(dynamic body) {
    if (body is Map && body.containsKey('data')) return body['data'];
    return body;
  }

  /// Extracts the paginated `items` list from `{ "data": { "items": [...] } }`.
  List _items(dynamic body) {
    final data = _unwrap(body);
    if (data is Map && data['items'] is List) return data['items'] as List;
    if (data is List) return data;
    return const [];
  }
}
