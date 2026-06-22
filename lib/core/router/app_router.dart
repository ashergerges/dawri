import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/services/ui/offline_internet_screen.dart';
import 'package:dawri/core/services/ui/server_error_screen.dart';
import 'package:dawri/features/create_championship/ui/create_championship_screen.dart';
import 'package:dawri/features/reserve/ui/reserve_now_screen.dart';
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
    AutoRoute(path: '*', page: NotFoundRoute.page), // this must be last route

  ];
}
