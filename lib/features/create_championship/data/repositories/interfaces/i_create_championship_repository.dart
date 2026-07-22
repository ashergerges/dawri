// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';

abstract class ICreateChampionshipRepository {
  Future<Result<List<SportModel>>> getSports();
  Future<Result<List<ChampionshipTypeModel>>> getChampionshipTypes();
  Future<Result<List<RegistrationModeModel>>> getRegistrationModes();
  Future<Result<List<CityModel>>> getCities();
  Future<Result<String>> launchTournament({required Map<String, dynamic> body});
}