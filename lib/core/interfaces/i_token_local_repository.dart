import 'package:async/async.dart';

abstract class ITokenLocalRepository {
  Future<Result<String?>> getToken();
}