import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/splash/data/repositories/interfaces/i_splash_repository.dart';
import 'package:dawri/main_common.dart';


part 'splash_cubit.freezed.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
    : _localPreference = getIt<ILocalPreference>(),
      _splashRepository = getIt<ISplashRepository>(),
      super(const SplashState.initial());

  final ILocalPreference _localPreference;
  final ISplashRepository _splashRepository;

  Future<void> init() async {
   await  Future.wait([
      getAppStartUpStatus(),
      support(),
     ]);
  }

  Future<void> support() async {
    // var support = await _splashRepository.support();
    // if (support.isError) {
    //   MessageService.showToast(
    //     msg: support.asError?.error.toString() ?? "",
    //     state: ToastStates.error,
    //   );
    // }
    // _localPreference.saveSupport(support.asValue?.value);
  }


  Future<void> getAppStartUpStatus() async {



    final hasConnection = await InternetConnectionChecker().hasConnection;
    if (!hasConnection) {
      return getIt<AppRouter>().replaceAll([const NoInternetSplashRoute()], updateExistingRoutes: false);
    }
    getIt<AppRouter>().replaceAll([
      LoginRoute()
    ], updateExistingRoutes: false);
  }
}
