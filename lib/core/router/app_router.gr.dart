// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CreateChampionshipScreen]
class CreateChampionshipRoute extends PageRouteInfo<void> {
  const CreateChampionshipRoute({List<PageRouteInfo>? children})
    : super(CreateChampionshipRoute.name, initialChildren: children);

  static const String name = 'CreateChampionshipRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateChampionshipScreen();
    },
  );
}

/// generated route for
/// [HomeBottomTabsScreen]
class HomeBottomTabsRoute extends PageRouteInfo<HomeBottomTabsRouteArgs> {
  HomeBottomTabsRoute({Key? key, int index = 0, List<PageRouteInfo>? children})
    : super(
        HomeBottomTabsRoute.name,
        args: HomeBottomTabsRouteArgs(key: key, index: index),
        initialChildren: children,
      );

  static const String name = 'HomeBottomTabsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeBottomTabsRouteArgs>(
        orElse: () => const HomeBottomTabsRouteArgs(),
      );
      return HomeBottomTabsScreen(key: args.key, index: args.index);
    },
  );
}

class HomeBottomTabsRouteArgs {
  const HomeBottomTabsRouteArgs({this.key, this.index = 0});

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'HomeBottomTabsRouteArgs{key: $key, index: $index}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeBottomTabsRouteArgs) return false;
    return key == other.key && index == other.index;
  }

  @override
  int get hashCode => key.hashCode ^ index.hashCode;
}

/// generated route for
/// [ImageViewerScreen]
class ImageViewerRoute extends PageRouteInfo<ImageViewerRouteArgs> {
  ImageViewerRoute({
    Key? key,
    required String imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
         ImageViewerRoute.name,
         args: ImageViewerRouteArgs(key: key, imageUrl: imageUrl),
         initialChildren: children,
       );

  static const String name = 'ImageViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageViewerRouteArgs>();
      return ImageViewerScreen(key: args.key, imageUrl: args.imageUrl);
    },
  );
}

class ImageViewerRouteArgs {
  const ImageViewerRouteArgs({this.key, required this.imageUrl});

  final Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'ImageViewerRouteArgs{key: $key, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImageViewerRouteArgs) return false;
    return key == other.key && imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => key.hashCode ^ imageUrl.hashCode;
}

/// generated route for
/// [NoInternetSplashScreen]
class NoInternetSplashRoute extends PageRouteInfo<void> {
  const NoInternetSplashRoute({List<PageRouteInfo>? children})
    : super(NoInternetSplashRoute.name, initialChildren: children);

  static const String name = 'NoInternetSplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NoInternetSplashScreen();
    },
  );
}

/// generated route for
/// [NotFoundScreen]
class NotFoundRoute extends PageRouteInfo<void> {
  const NotFoundRoute({List<PageRouteInfo>? children})
    : super(NotFoundRoute.name, initialChildren: children);

  static const String name = 'NotFoundRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotFoundScreen();
    },
  );
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [OfflineInternetScreen]
class OfflineInternetRoute extends PageRouteInfo<OfflineInternetRouteArgs> {
  OfflineInternetRoute({
    Key? key,
    required AutoRoutePage<dynamic> currentRoute,
    List<PageRouteInfo>? children,
  }) : super(
         OfflineInternetRoute.name,
         args: OfflineInternetRouteArgs(key: key, currentRoute: currentRoute),
         initialChildren: children,
       );

  static const String name = 'OfflineInternetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OfflineInternetRouteArgs>();
      return OfflineInternetScreen(
        key: args.key,
        currentRoute: args.currentRoute,
      );
    },
  );
}

class OfflineInternetRouteArgs {
  const OfflineInternetRouteArgs({this.key, required this.currentRoute});

  final Key? key;

  final AutoRoutePage<dynamic> currentRoute;

  @override
  String toString() {
    return 'OfflineInternetRouteArgs{key: $key, currentRoute: $currentRoute}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OfflineInternetRouteArgs) return false;
    return key == other.key && currentRoute == other.currentRoute;
  }

  @override
  int get hashCode => key.hashCode ^ currentRoute.hashCode;
}

/// generated route for
/// [ServerErrorScreen]
class ServerErrorRoute extends PageRouteInfo<ServerErrorRouteArgs> {
  ServerErrorRoute({
    Key? key,
    required AutoRoutePage<dynamic> currentRoute,
    List<PageRouteInfo>? children,
  }) : super(
         ServerErrorRoute.name,
         args: ServerErrorRouteArgs(key: key, currentRoute: currentRoute),
         initialChildren: children,
       );

  static const String name = 'ServerErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServerErrorRouteArgs>();
      return ServerErrorScreen(key: args.key, currentRoute: args.currentRoute);
    },
  );
}

class ServerErrorRouteArgs {
  const ServerErrorRouteArgs({this.key, required this.currentRoute});

  final Key? key;

  final AutoRoutePage<dynamic> currentRoute;

  @override
  String toString() {
    return 'ServerErrorRouteArgs{key: $key, currentRoute: $currentRoute}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ServerErrorRouteArgs) return false;
    return key == other.key && currentRoute == other.currentRoute;
  }

  @override
  int get hashCode => key.hashCode ^ currentRoute.hashCode;
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
