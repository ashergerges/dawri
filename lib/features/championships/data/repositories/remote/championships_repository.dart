import 'package:async/async.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/championships/data/models/championship_model.dart';
import 'package:dawri/features/championships/data/repositories/interfaces/i_championships_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IChampionshipsRepository)
class ChampionshipsRepository implements IChampionshipsRepository {
  final NetworkService networkService;

  ChampionshipsRepository({required this.networkService});

// championship_add_team_repository.dart
  @override
  Future<Result<List<ChampionshipModel>>> getChampionships({
    required int status,
    required int page,
    int limit = 15,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipsUrl,
      queryParameters: {
        'status': status,
        'page': page,
        'limit': limit,
      },
    );

    if (response.isError) return Result.error(response.asError!.error);

    final data = response.asValue!.value.data['data'] as List? ?? [];
    final items = data.map((e) => ChampionshipModel.fromJson(e)).toList();
    return Result.value(items);
  }
}