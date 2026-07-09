import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/interfaces/i_token_repository.dart';
import 'package:dawri/core/services/models/refresh_token_model.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:async/async.dart';
import 'package:dawri/main_common.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/constants/constants.dart';

@Singleton(as: ITokenRepository)
class TokenRepository implements ITokenRepository {
  final ILocalPreference localPreference;

  TokenRepository({required this.localPreference});

  @override
  Future<Result<RefreshTokenModel>> refreshTokenAsync() async {
    var response = await getIt<NetworkService>().postAsync(
      url: AppStrings.urls.refreshTokenUrl,
      body: {"refreshToken": localPreference.appUser.value?.refreshToken ?? ""},
    );

    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(RefreshTokenModel.fromJson(response.asValue!.value.data['result']));
  }
}
