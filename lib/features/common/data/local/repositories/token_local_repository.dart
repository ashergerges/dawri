import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:async/async.dart';
import 'package:dawri/core/interfaces/i_token_local_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ITokenLocalRepository)
class TokenLocalRepository implements ITokenLocalRepository {
  final ILocalPreference localPreference;

  TokenLocalRepository({required this.localPreference});

  @override
  Future<Result<String?>> getToken() async {
    var token = localPreference.appUser.value?.token ??"";
    return Result.value(token);
  }
}
