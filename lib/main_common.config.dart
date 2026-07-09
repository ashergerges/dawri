// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/interfaces/i_connection_service.dart' as _i952;
import 'core/interfaces/i_local_preference.dart' as _i865;
import 'core/interfaces/i_token_local_repository.dart' as _i735;
import 'core/interfaces/i_token_repository.dart' as _i892;
import 'core/router/app_router.dart' as _i110;
import 'core/services/alice/alice_service.dart' as _i854;
import 'core/services/dialogs/message_service.dart' as _i392;
import 'core/services/network/connection_service.dart' as _i943;
import 'core/services/network/interceptors/auth_interceptor.dart' as _i202;
import 'core/services/network/network_service.dart' as _i969;
import 'core/services/network/token_service.dart' as _i797;
import 'core/services/notification/notifications_service.dart' as _i402;
import 'core/services/upgrader/upgrader_service.dart' as _i289;
import 'core/utils/helper/error_handler.dart' as _i785;
import 'features/cart/data/repositories/interfaces/i_cart_repository.dart'
    as _i775;
import 'features/cart/data/repositories/remote/cart_repository.dart' as _i48;
import 'features/common/data/local/data_sources/local_storage.dart' as _i656;
import 'features/common/data/local/repositories/token_local_repository.dart'
    as _i784;
import 'features/common/data/local/repositories/token_repository.dart' as _i723;
import 'features/common/data/repositories/interfaces/i_main_repository.dart'
    as _i967;
import 'features/common/data/repositories/remote/main_repository.dart' as _i210;
import 'features/home/data/repositories/interfaces/i_home_repository.dart'
    as _i185;
import 'features/home/data/repositories/remote/home_repository.dart' as _i975;
import 'features/login/data/repository/interface/i_login_repository.dart'
    as _i772;
import 'features/login/data/repository/remote/login_repository.dart' as _i413;
import 'features/notification/data/repositories/interfaces/i_notification_repository.dart'
    as _i493;
import 'features/notification/data/repositories/remote/notification_repository.dart'
    as _i782;
import 'features/notifications/data/repositories/interfaces/i_notifications_repository.dart'
    as _i97;
import 'features/notifications/data/repositories/remote/notifications_repository.dart'
    as _i192;
import 'features/product_details/data/repositories/interfaces/i_product_details_repository.dart'
    as _i873;
import 'features/product_details/data/repositories/remote/product_details_repository.dart'
    as _i442;
import 'features/splash/cubits/splash_cubit/splash_cubit.dart' as _i331;
import 'features/splash/data/repositories/interfaces/i_splash_repository.dart'
    as _i561;
import 'features/splash/data/repositories/remote/splash_repository.dart'
    as _i120;
import 'features/store/data/repository/interface/i_store_repository.dart'
    as _i255;
import 'features/store/data/repository/remote/store_repository.dart' as _i77;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.factory<_i331.SplashCubit>(() => _i331.SplashCubit());
  gh.singleton<_i110.AppRouter>(() => _i110.AppRouter());
  gh.singleton<_i854.AliceService>(() => _i854.AliceService());
  gh.singleton<_i392.MessageService>(() => _i392.MessageService());
  gh.singleton<_i785.ErrorHandler>(() => _i785.ErrorHandler());
  gh.singleton<_i865.ILocalPreference>(() => _i656.LocalPreferenceImpl());
  gh.singleton<_i952.IConnectionService>(() => _i943.ConnectionService());
  gh.singleton<_i735.ITokenLocalRepository>(
    () => _i784.TokenLocalRepository(
      localPreference: gh<_i865.ILocalPreference>(),
    ),
  );
  gh.factory<_i289.IUpGraderService>(() => _i289.UpGraderService());
  gh.singleton<_i892.ITokenRepository>(
    () => _i723.TokenRepository(localPreference: gh<_i865.ILocalPreference>()),
  );
  gh.singleton<_i797.TokenService>(
    () => _i797.TokenService(
      tokenRepository: gh<_i892.ITokenRepository>(),
      tokenLocalRepository: gh<_i735.ITokenLocalRepository>(),
    ),
  );
  gh.singleton<_i202.AuthInterceptor>(
    () => _i202.AuthInterceptor(gh<_i797.TokenService>()),
  );
  gh.singleton<_i969.NetworkService>(
    () => _i969.NetworkService(
      tokenService: gh<_i797.TokenService>(),
      aliceService: gh<_i854.AliceService>(),
    ),
  );
  gh.factory<_i561.ISplashRepository>(
    () => _i120.SplashRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i775.ICartRepository>(
    () => _i48.CartRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i185.IHomeRepository>(
    () => _i975.HomeRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i493.INotificationRepository>(
    () => _i782.NotificationRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i97.INotificationsRepository>(
    () => _i192.NotificationsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i255.IStoreRepository>(
    () => _i77.StoreRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i873.IProductDetailsRepository>(
    () => _i442.ProductDetailsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i967.IMainRepository>(
    () => _i210.MainRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i772.IAuthRepo>(
    () => _i413.AuthRepo(networkService: gh<_i969.NetworkService>()),
  );
  gh.singleton<_i402.NotificationService>(
    () => _i402.NotificationService(
      notificationsRepository: gh<_i97.INotificationsRepository>(),
      localePreference: gh<_i865.ILocalPreference>(),
    ),
  );
  return getIt;
}
