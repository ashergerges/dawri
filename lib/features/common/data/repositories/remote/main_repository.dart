import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/common/data/local/models/app_footer.dart';
import 'package:dawri/features/common/data/local/models/app_user.dart';
import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/constants/constants.dart';
import '../../local/models/basic_response.dart';
import '../interfaces/i_main_repository.dart';

@Injectable(as: IMainRepository)
class MainRepository implements IMainRepository {
  final NetworkService networkService;

  MainRepository({required this.networkService});

  @override
  Future<Result<AppUser>> updateUserDate() async {
    var response = await networkService.getAsync(url: AppStrings.urls.updateUserDataUrl);
    if (response.isError) return Result.error(response.asError!.error);
    BasicResponse<AppUser> data = BasicResponse.fromJson(response.asValue!.value.data, (Object? json) {
      return AppUser.fromJson(json as Map<String, dynamic>);
    });
    return Result.value(data.result!);
  }

}
