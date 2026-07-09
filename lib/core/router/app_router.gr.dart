// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CartScreen();
    },
  );
}

/// generated route for
/// [ChallengesScreen]
class ChallengesRoute extends PageRouteInfo<void> {
  const ChallengesRoute({List<PageRouteInfo>? children})
    : super(ChallengesRoute.name, initialChildren: children);

  static const String name = 'ChallengesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChallengesScreen();
    },
  );
}

/// generated route for
/// [ChampProfileScreen]
class ChampProfileRoute extends PageRouteInfo<void> {
  const ChampProfileRoute({List<PageRouteInfo>? children})
    : super(ChampProfileRoute.name, initialChildren: children);

  static const String name = 'ChampProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChampProfileScreen();
    },
  );
}

/// generated route for
/// [ChampionshipAddTeamScreen]
class ChampionshipAddTeamRoute extends PageRouteInfo<void> {
  const ChampionshipAddTeamRoute({List<PageRouteInfo>? children})
    : super(ChampionshipAddTeamRoute.name, initialChildren: children);

  static const String name = 'ChampionshipAddTeamRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChampionshipAddTeamScreen();
    },
  );
}

/// generated route for
/// [ChampionshipControlScreen]
class ChampionshipControlRoute extends PageRouteInfo<void> {
  const ChampionshipControlRoute({List<PageRouteInfo>? children})
    : super(ChampionshipControlRoute.name, initialChildren: children);

  static const String name = 'ChampionshipControlRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChampionshipControlScreen();
    },
  );
}

/// generated route for
/// [ChampionshipRegisterScreen]
class ChampionshipRegisterRoute extends PageRouteInfo<void> {
  const ChampionshipRegisterRoute({List<PageRouteInfo>? children})
    : super(ChampionshipRegisterRoute.name, initialChildren: children);

  static const String name = 'ChampionshipRegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChampionshipRegisterScreen();
    },
  );
}

/// generated route for
/// [ChargeWalletScreen]
class ChargeWalletRoute extends PageRouteInfo<void> {
  const ChargeWalletRoute({List<PageRouteInfo>? children})
    : super(ChargeWalletRoute.name, initialChildren: children);

  static const String name = 'ChargeWalletRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChargeWalletScreen();
    },
  );
}

/// generated route for
/// [ContractDetailsScreen]
class ContractDetailsRoute extends PageRouteInfo<void> {
  const ContractDetailsRoute({List<PageRouteInfo>? children})
    : super(ContractDetailsRoute.name, initialChildren: children);

  static const String name = 'ContractDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContractDetailsScreen();
    },
  );
}

/// generated route for
/// [ContractsScreen]
class ContractsRoute extends PageRouteInfo<void> {
  const ContractsRoute({List<PageRouteInfo>? children})
    : super(ContractsRoute.name, initialChildren: children);

  static const String name = 'ContractsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContractsScreen();
    },
  );
}

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
/// [CreateContractScreen]
class CreateContractRoute extends PageRouteInfo<void> {
  const CreateContractRoute({List<PageRouteInfo>? children})
    : super(CreateContractRoute.name, initialChildren: children);

  static const String name = 'CreateContractRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateContractScreen();
    },
  );
}

/// generated route for
/// [HelpCenterScreen]
class HelpCenterRoute extends PageRouteInfo<void> {
  const HelpCenterRoute({List<PageRouteInfo>? children})
    : super(HelpCenterRoute.name, initialChildren: children);

  static const String name = 'HelpCenterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HelpCenterScreen();
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
/// [InvitePlayerScreen]
class InvitePlayerRoute extends PageRouteInfo<void> {
  const InvitePlayerRoute({List<PageRouteInfo>? children})
    : super(InvitePlayerRoute.name, initialChildren: children);

  static const String name = 'InvitePlayerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InvitePlayerScreen();
    },
  );
}

/// generated route for
/// [LanguageScreen]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
    : super(LanguageRoute.name, initialChildren: children);

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [ManageTeamScreen]
class ManageTeamRoute extends PageRouteInfo<void> {
  const ManageTeamRoute({List<PageRouteInfo>? children})
    : super(ManageTeamRoute.name, initialChildren: children);

  static const String name = 'ManageTeamRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ManageTeamScreen();
    },
  );
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
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationsScreen();
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
/// [PartnerChatScreen]
class PartnerChatRoute extends PageRouteInfo<void> {
  const PartnerChatRoute({List<PageRouteInfo>? children})
    : super(PartnerChatRoute.name, initialChildren: children);

  static const String name = 'PartnerChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PartnerChatScreen();
    },
  );
}

/// generated route for
/// [PartnerDetailsScreen]
class PartnerDetailsRoute extends PageRouteInfo<void> {
  const PartnerDetailsRoute({List<PageRouteInfo>? children})
    : super(PartnerDetailsRoute.name, initialChildren: children);

  static const String name = 'PartnerDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PartnerDetailsScreen();
    },
  );
}

/// generated route for
/// [PartnersScreen]
class PartnersRoute extends PageRouteInfo<void> {
  const PartnersRoute({List<PageRouteInfo>? children})
    : super(PartnersRoute.name, initialChildren: children);

  static const String name = 'PartnersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PartnersScreen();
    },
  );
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    Key? key,
    required int productId,
    List<PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, productId: productId),
         rawPathParams: {'id': productId},
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProductDetailsRouteArgs>(
        orElse: () =>
            ProductDetailsRouteArgs(productId: pathParams.getInt('id')),
      );
      return ProductDetailsScreen(key: args.key, productId: args.productId);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.productId});

  final Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsRouteArgs) return false;
    return key == other.key && productId == other.productId;
  }

  @override
  int get hashCode => key.hashCode ^ productId.hashCode;
}

/// generated route for
/// [PurchaseHistoryScreen]
class PurchaseHistoryRoute extends PageRouteInfo<void> {
  const PurchaseHistoryRoute({List<PageRouteInfo>? children})
    : super(PurchaseHistoryRoute.name, initialChildren: children);

  static const String name = 'PurchaseHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PurchaseHistoryScreen();
    },
  );
}

/// generated route for
/// [ReserveNowScreen]
class ReserveNowRoute extends PageRouteInfo<void> {
  const ReserveNowRoute({List<PageRouteInfo>? children})
    : super(ReserveNowRoute.name, initialChildren: children);

  static const String name = 'ReserveNowRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReserveNowScreen();
    },
  );
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchScreen();
    },
  );
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

/// generated route for
/// [StadiumProfileScreen]
class StadiumProfileRoute extends PageRouteInfo<void> {
  const StadiumProfileRoute({List<PageRouteInfo>? children})
    : super(StadiumProfileRoute.name, initialChildren: children);

  static const String name = 'StadiumProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StadiumProfileScreen();
    },
  );
}

/// generated route for
/// [TicketsScreen]
class TicketsRoute extends PageRouteInfo<void> {
  const TicketsRoute({List<PageRouteInfo>? children})
    : super(TicketsRoute.name, initialChildren: children);

  static const String name = 'TicketsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TicketsScreen();
    },
  );
}

/// generated route for
/// [UpdateProfileScreen]
class UpdateProfileRoute extends PageRouteInfo<void> {
  const UpdateProfileRoute({List<PageRouteInfo>? children})
    : super(UpdateProfileRoute.name, initialChildren: children);

  static const String name = 'UpdateProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UpdateProfileScreen();
    },
  );
}
