import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/services/ui/offline_internet_screen.dart';
import 'package:dawri/core/services/ui/server_error_screen.dart';
import 'package:dawri/features/cart/ui/cart_screen.dart';
import 'package:dawri/features/challenges/ui/challenges_screen.dart';
import 'package:dawri/features/championship_add_team/ui/championship_add_team_screen.dart';
import 'package:dawri/features/championship_control/ui/championship_control_screen.dart';
import 'package:dawri/features/championship_register/ui/championship_register_screen.dart';
import 'package:dawri/features/contracts/ui/contract_screen.dart';
import 'package:dawri/features/create_championship/ui/create_championship_screen.dart';
import 'package:dawri/features/invite_player/ui/invite_player_screen.dart';
import 'package:dawri/features/manage_team/ui/manage_team_screen.dart';
import 'package:dawri/features/partner_chat/ui/partner_chat_screen.dart';
import 'package:dawri/features/partner_details/ui/partner_details_screen.dart';
import 'package:dawri/features/partners/ui/partners_screen.dart';
import 'package:dawri/features/product_details/ui/product_details_screen.dart';
import 'package:dawri/features/reserve/ui/reserve_now_screen.dart';
import 'package:dawri/features/tickets/ui/tickets_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/features/notification/ui/notification_screen.dart';
import 'package:dawri/features/splash/ui/no_internet_splash.dart';
import 'package:dawri/features/Tabs/ui/home_bottom_tabs_screen.dart';
import 'package:dawri/features/splash/ui/splash_screen.dart';
import '../services/ui/not_found_screen.dart';
import '../utils/common_widgets/image_viewer_screen.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
      path: '/',
      fullMatch: true,
      type: RouteType.custom(
        transitionsBuilder: (context, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    AutoRoute(path: '/home', page: HomeBottomTabsRoute.page),
    AutoRoute(page: OfflineInternetRoute.page),
    AutoRoute(page: ServerErrorRoute.page),
    AutoRoute(page: NoInternetSplashRoute.page),
    AutoRoute( page: NotificationRoute.page),
    AutoRoute( page: ImageViewerRoute.page),
    AutoRoute( page: CreateChampionshipRoute.page),
    AutoRoute( page: ReserveNowRoute.page),
    AutoRoute( page: ChampionshipAddTeamRoute.page),
    AutoRoute( page: ChampionshipRegisterRoute.page),
    AutoRoute( page: ChampionshipControlRoute.page),
    AutoRoute( page: CartRoute.page),
    AutoRoute( page: ProductDetailsRoute.page),
    AutoRoute( page: TicketsRoute.page),
    AutoRoute( page: ChallengesRoute.page),
    AutoRoute( page: ContractsRoute.page),
    AutoRoute( page: PartnersRoute.page),
    AutoRoute( page: PartnerChatRoute.page),
    AutoRoute( page: PartnerDetailsRoute.page),
    AutoRoute( page: ManageTeamRoute.page),
    AutoRoute( page: InvitePlayerRoute.page),
    AutoRoute(path: '*', page: NotFoundRoute.page), // this must be last route

  ];
}
