// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:dawri/features/home/data/models/home_model.dart';
abstract class IHomeRepository {
  Future<Result<HomeModel>> getHome();
  Future<Result<String>> addedToCart({required int id});
}
