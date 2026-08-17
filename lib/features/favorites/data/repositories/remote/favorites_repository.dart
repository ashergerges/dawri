// lib/features/favorites/data/repositories/remote/favorites_repository.dart
import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:dawri/features/favorites/data/models/favorite_model.dart';
import 'package:dawri/features/favorites/data/repositories/interfaces/i_favorites_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IFavoritesRepository)
class FavoritesRepository implements IFavoritesRepository {
  final NetworkService networkService;

  FavoritesRepository({required this.networkService});

  @override
  Future<Result<FavoritesPage>> getFavorites({
    required int type,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.wishlistTypeUrl,
      queryParameters: {'type': type, 'page': page, 'limit': limit},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? (data['items'] ?? data['wishlist']) : data)
              as List? ??
          [];

      return Result.value(FavoritesPage(
        // `type` is echoed per row by the server, but the list endpoint is
        // already filtered — fall back to the requested type when it's absent.
        items: list.map((e) {
          final json = Map<String, dynamic>.from(e);
          json['type'] ??= type;
          return FavoriteModel.fromJson(json);
        }).toList(),
        counts: data is Map && data['counts'] is Map
            ? FavoriteCounts.fromJson(Map<String, dynamic>.from(data['counts']))
            : null,
        pagination: data is Map && data['pagination'] is Map
            ? ApiPagination.fromJson(data['pagination'] as Map)
            : null,
      ));
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> toggleFavorite({
    required int type,
    required int id,
  }) async {
    // Each entity owns its own toggle route; participants take the id in the
    // query string while the rest take a body. Kept consistent with the
    // details screens that already call these.
    final response = switch (type) {
      FavoriteType.stadium => await networkService.postAsync(
          url: AppStrings.urls.stadiumsFavToggleUrl,
          body: {'id': id},
        ),
      FavoriteType.championship => await networkService.postAsync(
          url: AppStrings.urls.championshipFavoriteToggleUrl,
          body: {'id': id},
        ),
      FavoriteType.participant => await networkService.postAsync(
          url: AppStrings.urls.participantFavoriteUrl,
          queryParameters: {'id': id},
        ),
      _ => await networkService.postAsync(
          url: AppStrings.urls.productFavToggleUrl,
          body: {'id': id},
        ),
    };

    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
