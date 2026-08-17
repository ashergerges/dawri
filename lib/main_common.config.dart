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
import 'core/services/firebase/firebase_auth_service.dart' as _i106;
import 'core/services/firebase/firebase_user_sync_service.dart' as _i950;
import 'core/services/network/connection_service.dart' as _i943;
import 'core/services/network/interceptors/auth_interceptor.dart' as _i202;
import 'core/services/network/network_service.dart' as _i969;
import 'core/services/network/token_service.dart' as _i797;
import 'core/services/notification/notifications_service.dart' as _i402;
import 'core/services/upgrader/upgrader_service.dart' as _i289;
import 'core/utils/helper/error_handler.dart' as _i785;
import 'features/booking_history/data/repositories/interfaces/i_booking_history_repository.dart'
    as _i667;
import 'features/booking_history/data/repositories/remote/booking_history_repository.dart'
    as _i433;
import 'features/cart/data/repositories/interfaces/i_cart_repository.dart'
    as _i775;
import 'features/cart/data/repositories/remote/cart_repository.dart' as _i48;
import 'features/challenges/data/repositories/interfaces/i_challenges_repository.dart'
    as _i618;
import 'features/challenges/data/repositories/remote/challenges_repository.dart'
    as _i730;
import 'features/champ_profile/data/repositories/interfaces/i_champ_profile_repository.dart'
    as _i312;
import 'features/champ_profile/data/repositories/remote/champ_profile_repository.dart'
    as _i722;
import 'features/championship_add_team/data/repositories/interfaces/i_championship_add_team_repository.dart'
    as _i598;
import 'features/championship_add_team/data/repositories/remote/championship_add_team_repository.dart'
    as _i747;
import 'features/championship_control/data/repositories/interfaces/i_championship_control_repository.dart'
    as _i779;
import 'features/championship_control/data/repositories/remote/championship_control_repository.dart'
    as _i22;
import 'features/championship_register/data/repositories/interfaces/i_championship_register_repository.dart'
    as _i545;
import 'features/championship_register/data/repositories/remote/championship_register_repository.dart'
    as _i307;
import 'features/championships/data/repositories/interfaces/i_championships_repository.dart'
    as _i651;
import 'features/championships/data/repositories/remote/championships_repository.dart'
    as _i419;
import 'features/charge_wallet/data/repositories/interfaces/i_charge_wallet_repository.dart'
    as _i1068;
import 'features/charge_wallet/data/repositories/remote/charge_wallet_repository.dart'
    as _i895;
import 'features/common/data/local/data_sources/local_storage.dart' as _i656;
import 'features/common/data/local/repositories/token_local_repository.dart'
    as _i784;
import 'features/common/data/local/repositories/token_repository.dart' as _i723;
import 'features/common/data/repositories/interfaces/i_main_repository.dart'
    as _i967;
import 'features/common/data/repositories/remote/main_repository.dart' as _i210;
import 'features/contract_details/data/repositories/interfaces/i_contract_details_repository.dart'
    as _i1054;
import 'features/contract_details/data/repositories/remote/contract_details_repository.dart'
    as _i366;
import 'features/contracts/data/repositories/interfaces/i_contracts_repository.dart'
    as _i568;
import 'features/contracts/data/repositories/remote/contracts_repository.dart'
    as _i144;
import 'features/create_challenge/data/repositories/interfaces/i_challenge_repository.dart'
    as _i1022;
import 'features/create_challenge/data/repositories/remote/challenge_repository.dart'
    as _i690;
import 'features/create_championship/data/repositories/interfaces/i_create_championship_repository.dart'
    as _i93;
import 'features/create_championship/data/repositories/remote/create_championship_repository.dart'
    as _i638;
import 'features/create_contract/data/repositories/interfaces/i_create_contract_repository.dart'
    as _i1001;
import 'features/create_contract/data/repositories/remote/create_contract_repository.dart'
    as _i920;
import 'features/create_team/data/repositories/interfaces/i_create_team_repository.dart'
    as _i369;
import 'features/create_team/data/repositories/remote/create_team_repository.dart'
    as _i334;
import 'features/help_center/data/repositories/interfaces/i_help_center_repository.dart'
    as _i305;
import 'features/help_center/data/repositories/remote/help_center_repository.dart'
    as _i221;
import 'features/home/data/repositories/interfaces/i_home_repository.dart'
    as _i185;
import 'features/home/data/repositories/remote/home_repository.dart' as _i975;
import 'features/login/data/repository/interface/i_login_repository.dart'
    as _i772;
import 'features/login/data/repository/remote/login_repository.dart' as _i413;
import 'features/manage_team/data/repositories/interfaces/i_manage_team_repository.dart'
    as _i778;
import 'features/manage_team/data/repositories/remote/manage_team_repository.dart'
    as _i57;
import 'features/my_challenges/data/repositories/interfaces/i_my_challenges_repository.dart'
    as _i655;
import 'features/my_challenges/data/repositories/remote/my_challenges_repository.dart'
    as _i339;
import 'features/my_championships/data/repositories/interfaces/i_my_championships_repository.dart'
    as _i735;
import 'features/my_championships/data/repositories/remote/my_championships_repository.dart'
    as _i730;
import 'features/notifications/data/repositories/interfaces/i_notifications_repository.dart'
    as _i97;
import 'features/notifications/data/repositories/interfaces/i_user_notifications_repository.dart'
    as _i1005;
import 'features/notifications/data/repositories/remote/notifications_repository.dart'
    as _i192;
import 'features/notifications/data/repositories/remote/user_notifications_repository.dart'
    as _i753;
import 'features/partner_chat/data/repositories/interfaces/i_chat_repository.dart'
    as _i474;
import 'features/partner_chat/data/repositories/remote/chat_repository.dart'
    as _i924;
import 'features/partner_details/data/repositories/interfaces/i_partner_details_repository.dart'
    as _i327;
import 'features/partner_details/data/repositories/remote/partner_details_repository.dart'
    as _i710;
import 'features/partners/data/repositories/interfaces/i_partners_repository.dart'
    as _i828;
import 'features/partners/data/repositories/remote/partners_repository.dart'
    as _i1020;
import 'features/product_details/data/repositories/interfaces/i_product_details_repository.dart'
    as _i873;
import 'features/product_details/data/repositories/remote/product_details_repository.dart'
    as _i442;
import 'features/purchase_history/data/repositories/interfaces/i_purchase_history_repository.dart'
    as _i359;
import 'features/purchase_history/data/repositories/remote/purchase_history_repository.dart'
    as _i72;
import 'features/register/data/repositories/interfaces/i_register_repository.dart'
    as _i720;
import 'features/register/data/repositories/remote/register_repository.dart'
    as _i423;
import 'features/reserve/data/repositories/interfaces/i_reserve_repository.dart'
    as _i817;
import 'features/reserve/data/repositories/remote/reserve_repository.dart'
    as _i124;
import 'features/search/data/repositories/interfaces/i_search_repository.dart'
    as _i310;
import 'features/search/data/repositories/remote/search_repository.dart'
    as _i361;
import 'features/splash/cubits/splash_cubit/splash_cubit.dart' as _i331;
import 'features/splash/data/repositories/interfaces/i_splash_repository.dart'
    as _i561;
import 'features/splash/data/repositories/remote/splash_repository.dart'
    as _i120;
import 'features/stadium_profile/data/repositories/interfaces/i_stadium_profile_repository.dart'
    as _i1053;
import 'features/stadium_profile/data/repositories/remote/stadium_profile_repository.dart'
    as _i44;
import 'features/stadiums/data/repositories/interfaces/i_stadiums_repository.dart'
    as _i547;
import 'features/stadiums/data/repositories/remote/stadiums_repository.dart'
    as _i400;
import 'features/store/data/repository/interface/i_store_repository.dart'
    as _i255;
import 'features/store/data/repository/remote/store_repository.dart' as _i77;
import 'features/team_profile/data/repositories/interfaces/i_team_profile_repository.dart'
    as _i55;
import 'features/team_profile/data/repositories/remote/team_profile_repository.dart'
    as _i378;
import 'features/tickets/data/repository/interface/i_tickets_repository.dart'
    as _i773;
import 'features/tickets/data/repository/remote/tickets_repository.dart'
    as _i305;
import 'features/update_profile/data/repositories/interfaces/i_update_profile_repository.dart'
    as _i289;
import 'features/update_profile/data/repositories/remote/update_profile_repository.dart'
    as _i609;

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
  gh.factory<_i474.IChatRepository>(
    () => _i924.ChatRepository(preference: gh<_i865.ILocalPreference>()),
  );
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
  gh.factory<_i310.ISearchRepository>(
    () => _i361.SearchRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i359.IPurchaseHistoryRepository>(
    () => _i72.PurchaseHistoryRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i561.ISplashRepository>(
    () => _i120.SplashRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i775.ICartRepository>(
    () => _i48.CartRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i1005.IUserNotificationsRepository>(
    () => _i753.UserNotificationsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i1022.IChallengeRepository>(
    () => _i690.ChallengeRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i773.ITicketsRepository>(
    () => _i305.TicketsRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i828.IPartnersRepository>(
    () => _i1020.PartnersRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i735.IMyChampionshipsRepository>(
    () => _i730.MyChampionshipsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i369.ICreateTeamRepository>(
    () =>
        _i334.CreateTeamRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i327.IPartnerDetailsRepository>(
    () => _i710.PartnerDetailsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i185.IHomeRepository>(
    () => _i975.HomeRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i618.IChallengesRepository>(
    () =>
        _i730.ChallengesRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i1054.IContractDetailsRepository>(
    () => _i366.ContractDetailsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i779.IChampionshipControlRepository>(
    () => _i22.ChampionshipControlRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i312.IChampProfileRepository>(
    () => _i722.ChampProfileRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i667.IBookingHistoryRepository>(
    () => _i433.BookingHistoryRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i778.IManageTeamRepository>(
    () => _i57.ManageTeamRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i598.IChampionshipAddTeamRepository>(
    () => _i747.ChampionshipAddTeamRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.singleton<_i106.FirebaseAuthService>(
    () => _i106.FirebaseAuthService(
      networkService: gh<_i969.NetworkService>(),
      preference: gh<_i865.ILocalPreference>(),
    ),
  );
  gh.factory<_i97.INotificationsRepository>(
    () => _i192.NotificationsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i289.IUpdateProfileRepository>(
    () => _i609.UpdateProfileRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i1068.IChargeWalletRepository>(
    () => _i895.ChargeWalletRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i93.ICreateChampionshipRepository>(
    () => _i638.CreateChampionshipRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i655.IMyChallengesRepository>(
    () => _i339.MyChallengesRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i651.IChampionshipsRepository>(
    () => _i419.ChampionshipsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i547.IStadiumsRepository>(
    () => _i400.StadiumsRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i255.IStoreRepository>(
    () => _i77.StoreRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i873.IProductDetailsRepository>(
    () => _i442.ProductDetailsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i1001.ICreateContractRepository>(
    () => _i920.CreateContractRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i817.IReserveRepository>(
    () => _i124.ReserveRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i305.IHelpCenterRepository>(
    () =>
        _i221.HelpCenterRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i967.IMainRepository>(
    () => _i210.MainRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i545.IChampionshipRegisterRepository>(
    () => _i307.ChampionshipRegisterRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i720.IRegisterRepository>(
    () => _i423.RegisterRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i55.ITeamProfileRepository>(
    () =>
        _i378.TeamProfileRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i1053.IStadiumProfileRepository>(
    () => _i44.StadiumProfileRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i772.IAuthRepo>(
    () => _i413.AuthRepo(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i568.IContractsRepository>(
    () => _i144.ContractsRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.singleton<_i950.FirebaseUserSyncService>(
    () => _i950.FirebaseUserSyncService(
      preference: gh<_i865.ILocalPreference>(),
      authService: gh<_i106.FirebaseAuthService>(),
    ),
  );
  gh.singleton<_i402.NotificationService>(
    () => _i402.NotificationService(
      notificationsRepository: gh<_i97.INotificationsRepository>(),
      localePreference: gh<_i865.ILocalPreference>(),
    ),
  );
  return getIt;
}
