// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/services/network/network_service.dart';
import '../interfaces/i_home_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final NetworkService networkService;

  HomeRepository({required this.networkService});

}
