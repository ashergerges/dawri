import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:upgrader/upgrader.dart';

abstract class IUpGraderService {
  Future<bool> checkForUpdate();
}

@Injectable(as: IUpGraderService)
class UpGraderService implements IUpGraderService {
  @override
  Future<bool> checkForUpdate() async {
    final upGrader = Upgrader.sharedInstance;

    await upGrader.initialize();

    final isUpdateAvailable = upGrader.isUpdateAvailable();
    log('Is update available: $isUpdateAvailable');
    return isUpdateAvailable;
  }
}
