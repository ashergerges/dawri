// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:dawri/features/championships/data/models/championship_model.dart';

abstract class IChampionshipsRepository {
  Future<Result<List<ChampionshipModel>>> getChampionships({
    required int status,
    required int page,
    int limit = 15,
  });
}