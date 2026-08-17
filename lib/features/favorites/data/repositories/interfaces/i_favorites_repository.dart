// lib/features/favorites/data/repositories/interfaces/i_favorites_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/favorites/data/models/favorite_model.dart';

abstract class IFavoritesRepository {
  /// [type] is one of [FavoriteType.product] / `.stadium` / `.championship` /
  /// `.participant`.
  Future<Result<FavoritesPage>> getFavorites({
    required int type,
    required int page,
    int limit = 10,
  });

  /// Un-favourites (or re-favourites) an entity. Routed to the existing
  /// per-type toggle endpoint — there is no unified one.
  Future<Result<String>> toggleFavorite({
    required int type,
    required int id,
  });
}
