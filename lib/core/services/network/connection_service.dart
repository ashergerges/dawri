import 'package:dawri/core/interfaces/i_connection_service.dart';
import 'package:injectable/injectable.dart';
  import 'package:internet_connection_checker/internet_connection_checker.dart';

@Singleton(as: IConnectionService)
class ConnectionService implements IConnectionService{

  @override
  Future<bool> checkConnection() {
    return InternetConnectionChecker().hasConnection;
  }
}