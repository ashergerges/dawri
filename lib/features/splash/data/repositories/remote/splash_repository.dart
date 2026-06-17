import 'dart:developer';

import 'package:dawri/core/services/network/network_service.dart';
import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/features/splash/data/models/settings_model.dart';
import '../../../../../core/utils/constants/constants.dart';
import '../interfaces/i_splash_repository.dart';

@Injectable(as: ISplashRepository)
class SplashRepository implements ISplashRepository {
  final NetworkService networkService;

  SplashRepository({required this.networkService});
  @override
  Future<Result<SettingsModel>> support() async {
    var response = await networkService.getAsync(
        url: AppStrings.urls.supportUrl,

    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");
    return Result.value(
      SettingsModel.fromJson(response.asValue?.value.data['data']),
    );
  }

}
