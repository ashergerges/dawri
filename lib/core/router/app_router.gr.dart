// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BookingHistoryScreen]
class BookingHistoryRoute extends PageRouteInfo<void> {
  const BookingHistoryRoute({List<PageRouteInfo>? children})
    : super(BookingHistoryRoute.name, initialChildren: children);

  static const String name = 'BookingHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BookingHistoryScreen();
    },
  );
}

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
class ChampProfileRoute extends PageRouteInfo<ChampProfileRouteArgs> {
  ChampProfileRoute({
    Key? key,
    required int championshipId,
    List<PageRouteInfo>? children,
  }) : super(
         ChampProfileRoute.name,
         args: ChampProfileRouteArgs(key: key, championshipId: championshipId),
         initialChildren: children,
       );

  static const String name = 'ChampProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChampProfileRouteArgs>();
      return ChampProfileScreen(
        key: args.key,
        championshipId: args.championshipId,
      );
    },
  );
}

class ChampProfileRouteArgs {
  const ChampProfileRouteArgs({this.key, required this.championshipId});

  final Key? key;

  final int championshipId;

  @override
  String toString() {
    return 'ChampProfileRouteArgs{key: $key, championshipId: $championshipId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChampProfileRouteArgs) return false;
    return key == other.key && championshipId == other.championshipId;
  }

  @override
  int get hashCode => key.hashCode ^ championshipId.hashCode;
}

/// generated route for
/// [ChampionshipAddTeamScreen]
class ChampionshipAddTeamRoute
    extends PageRouteInfo<ChampionshipAddTeamRouteArgs> {
  ChampionshipAddTeamRoute({
    Key? key,
    required int id,
    required num fees,
    required String championName,
    required String type,
    required String date,
    List<PageRouteInfo>? children,
  }) : super(
         ChampionshipAddTeamRoute.name,
         args: ChampionshipAddTeamRouteArgs(
           key: key,
           id: id,
           fees: fees,
           championName: championName,
           type: type,
           date: date,
         ),
         initialChildren: children,
       );

  static const String name = 'ChampionshipAddTeamRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChampionshipAddTeamRouteArgs>();
      return ChampionshipAddTeamScreen(
        key: args.key,
        id: args.id,
        fees: args.fees,
        championName: args.championName,
        type: args.type,
        date: args.date,
      );
    },
  );
}

class ChampionshipAddTeamRouteArgs {
  const ChampionshipAddTeamRouteArgs({
    this.key,
    required this.id,
    required this.fees,
    required this.championName,
    required this.type,
    required this.date,
  });

  final Key? key;

  final int id;

  final num fees;

  final String championName;

  final String type;

  final String date;

  @override
  String toString() {
    return 'ChampionshipAddTeamRouteArgs{key: $key, id: $id, fees: $fees, championName: $championName, type: $type, date: $date}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChampionshipAddTeamRouteArgs) return false;
    return key == other.key &&
        id == other.id &&
        fees == other.fees &&
        championName == other.championName &&
        type == other.type &&
        date == other.date;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      id.hashCode ^
      fees.hashCode ^
      championName.hashCode ^
      type.hashCode ^
      date.hashCode;
}

/// generated route for
/// [ChampionshipControlScreen]
class ChampionshipControlRoute
    extends PageRouteInfo<ChampionshipControlRouteArgs> {
  ChampionshipControlRoute({
    Key? key,
    required int championshipId,
    List<PageRouteInfo>? children,
  }) : super(
         ChampionshipControlRoute.name,
         args: ChampionshipControlRouteArgs(
           key: key,
           championshipId: championshipId,
         ),
         initialChildren: children,
       );

  static const String name = 'ChampionshipControlRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChampionshipControlRouteArgs>();
      return ChampionshipControlScreen(
        key: args.key,
        championshipId: args.championshipId,
      );
    },
  );
}

class ChampionshipControlRouteArgs {
  const ChampionshipControlRouteArgs({this.key, required this.championshipId});

  final Key? key;

  final int championshipId;

  @override
  String toString() {
    return 'ChampionshipControlRouteArgs{key: $key, championshipId: $championshipId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChampionshipControlRouteArgs) return false;
    return key == other.key && championshipId == other.championshipId;
  }

  @override
  int get hashCode => key.hashCode ^ championshipId.hashCode;
}

/// generated route for
/// [ChampionshipRegisterScreen]
class ChampionshipRegisterRoute
    extends PageRouteInfo<ChampionshipRegisterRouteArgs> {
  ChampionshipRegisterRoute({
    Key? key,
    required int id,
    required num fees,
    required String championName,
    required String type,
    List<PageRouteInfo>? children,
  }) : super(
         ChampionshipRegisterRoute.name,
         args: ChampionshipRegisterRouteArgs(
           key: key,
           id: id,
           fees: fees,
           championName: championName,
           type: type,
         ),
         initialChildren: children,
       );

  static const String name = 'ChampionshipRegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChampionshipRegisterRouteArgs>();
      return ChampionshipRegisterScreen(
        key: args.key,
        id: args.id,
        fees: args.fees,
        championName: args.championName,
        type: args.type,
      );
    },
  );
}

class ChampionshipRegisterRouteArgs {
  const ChampionshipRegisterRouteArgs({
    this.key,
    required this.id,
    required this.fees,
    required this.championName,
    required this.type,
  });

  final Key? key;

  final int id;

  final num fees;

  final String championName;

  final String type;

  @override
  String toString() {
    return 'ChampionshipRegisterRouteArgs{key: $key, id: $id, fees: $fees, championName: $championName, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChampionshipRegisterRouteArgs) return false;
    return key == other.key &&
        id == other.id &&
        fees == other.fees &&
        championName == other.championName &&
        type == other.type;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      id.hashCode ^
      fees.hashCode ^
      championName.hashCode ^
      type.hashCode;
}

/// generated route for
/// [ChargeWalletScreen]
class ChargeWalletRoute extends PageRouteInfo<ChargeWalletRouteArgs> {
  ChargeWalletRoute({
    Key? key,
    double currentBalance = 0,
    List<PageRouteInfo>? children,
  }) : super(
         ChargeWalletRoute.name,
         args: ChargeWalletRouteArgs(key: key, currentBalance: currentBalance),
         initialChildren: children,
       );

  static const String name = 'ChargeWalletRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChargeWalletRouteArgs>(
        orElse: () => const ChargeWalletRouteArgs(),
      );
      return ChargeWalletScreen(
        key: args.key,
        currentBalance: args.currentBalance,
      );
    },
  );
}

class ChargeWalletRouteArgs {
  const ChargeWalletRouteArgs({this.key, this.currentBalance = 0});

  final Key? key;

  final double currentBalance;

  @override
  String toString() {
    return 'ChargeWalletRouteArgs{key: $key, currentBalance: $currentBalance}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChargeWalletRouteArgs) return false;
    return key == other.key && currentBalance == other.currentBalance;
  }

  @override
  int get hashCode => key.hashCode ^ currentBalance.hashCode;
}

/// generated route for
/// [ChatsListScreen]
class ChatsListRoute extends PageRouteInfo<void> {
  const ChatsListRoute({List<PageRouteInfo>? children})
    : super(ChatsListRoute.name, initialChildren: children);

  static const String name = 'ChatsListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatsListScreen();
    },
  );
}

/// generated route for
/// [ContractDetailsScreen]
class ContractDetailsRoute extends PageRouteInfo<ContractDetailsRouteArgs> {
  ContractDetailsRoute({
    Key? key,
    required int contractId,
    List<PageRouteInfo>? children,
  }) : super(
         ContractDetailsRoute.name,
         args: ContractDetailsRouteArgs(key: key, contractId: contractId),
         initialChildren: children,
       );

  static const String name = 'ContractDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContractDetailsRouteArgs>();
      return ContractDetailsScreen(key: args.key, contractId: args.contractId);
    },
  );
}

class ContractDetailsRouteArgs {
  const ContractDetailsRouteArgs({this.key, required this.contractId});

  final Key? key;

  final int contractId;

  @override
  String toString() {
    return 'ContractDetailsRouteArgs{key: $key, contractId: $contractId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ContractDetailsRouteArgs) return false;
    return key == other.key && contractId == other.contractId;
  }

  @override
  int get hashCode => key.hashCode ^ contractId.hashCode;
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
/// [CreateChallengeScreen]
class CreateChallengeRoute extends PageRouteInfo<void> {
  const CreateChallengeRoute({List<PageRouteInfo>? children})
    : super(CreateChallengeRoute.name, initialChildren: children);

  static const String name = 'CreateChallengeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateChallengeScreen();
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
class CreateContractRoute extends PageRouteInfo<CreateContractRouteArgs> {
  CreateContractRoute({
    Key? key,
    required int userId,
    required String name,
    String? avatar,
    List<PageRouteInfo>? children,
  }) : super(
         CreateContractRoute.name,
         args: CreateContractRouteArgs(
           key: key,
           userId: userId,
           name: name,
           avatar: avatar,
         ),
         initialChildren: children,
       );

  static const String name = 'CreateContractRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateContractRouteArgs>();
      return CreateContractScreen(
        key: args.key,
        userId: args.userId,
        name: args.name,
        avatar: args.avatar,
      );
    },
  );
}

class CreateContractRouteArgs {
  const CreateContractRouteArgs({
    this.key,
    required this.userId,
    required this.name,
    this.avatar,
  });

  final Key? key;

  final int userId;

  final String name;

  final String? avatar;

  @override
  String toString() {
    return 'CreateContractRouteArgs{key: $key, userId: $userId, name: $name, avatar: $avatar}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateContractRouteArgs) return false;
    return key == other.key &&
        userId == other.userId &&
        name == other.name &&
        avatar == other.avatar;
  }

  @override
  int get hashCode =>
      key.hashCode ^ userId.hashCode ^ name.hashCode ^ avatar.hashCode;
}

/// generated route for
/// [CreateTeamScreen]
class CreateTeamRoute extends PageRouteInfo<void> {
  const CreateTeamRoute({List<PageRouteInfo>? children})
    : super(CreateTeamRoute.name, initialChildren: children);

  static const String name = 'CreateTeamRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateTeamScreen();
    },
  );
}

/// generated route for
/// [EmptyMyTeamScreen]
class EmptyMyTeamRoute extends PageRouteInfo<void> {
  const EmptyMyTeamRoute({List<PageRouteInfo>? children})
    : super(EmptyMyTeamRoute.name, initialChildren: children);

  static const String name = 'EmptyMyTeamRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmptyMyTeamScreen();
    },
  );
}

/// generated route for
/// [FavoritesScreen]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesScreen();
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
class InvitePlayerRoute extends PageRouteInfo<InvitePlayerRouteArgs> {
  InvitePlayerRoute({
    Key? key,
    String? invitationLink,
    List<PageRouteInfo>? children,
  }) : super(
         InvitePlayerRoute.name,
         args: InvitePlayerRouteArgs(key: key, invitationLink: invitationLink),
         initialChildren: children,
       );

  static const String name = 'InvitePlayerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InvitePlayerRouteArgs>(
        orElse: () => const InvitePlayerRouteArgs(),
      );
      return InvitePlayerScreen(
        key: args.key,
        invitationLink: args.invitationLink,
      );
    },
  );
}

class InvitePlayerRouteArgs {
  const InvitePlayerRouteArgs({this.key, this.invitationLink});

  final Key? key;

  final String? invitationLink;

  @override
  String toString() {
    return 'InvitePlayerRouteArgs{key: $key, invitationLink: $invitationLink}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InvitePlayerRouteArgs) return false;
    return key == other.key && invitationLink == other.invitationLink;
  }

  @override
  int get hashCode => key.hashCode ^ invitationLink.hashCode;
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
/// [MyChallengeDetailsScreen]
class MyChallengeDetailsRoute
    extends PageRouteInfo<MyChallengeDetailsRouteArgs> {
  MyChallengeDetailsRoute({
    Key? key,
    required int challengeId,
    List<PageRouteInfo>? children,
  }) : super(
         MyChallengeDetailsRoute.name,
         args: MyChallengeDetailsRouteArgs(key: key, challengeId: challengeId),
         initialChildren: children,
       );

  static const String name = 'MyChallengeDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyChallengeDetailsRouteArgs>();
      return MyChallengeDetailsScreen(
        key: args.key,
        challengeId: args.challengeId,
      );
    },
  );
}

class MyChallengeDetailsRouteArgs {
  const MyChallengeDetailsRouteArgs({this.key, required this.challengeId});

  final Key? key;

  final int challengeId;

  @override
  String toString() {
    return 'MyChallengeDetailsRouteArgs{key: $key, challengeId: $challengeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyChallengeDetailsRouteArgs) return false;
    return key == other.key && challengeId == other.challengeId;
  }

  @override
  int get hashCode => key.hashCode ^ challengeId.hashCode;
}

/// generated route for
/// [MyChallengesScreen]
class MyChallengesRoute extends PageRouteInfo<void> {
  const MyChallengesRoute({List<PageRouteInfo>? children})
    : super(MyChallengesRoute.name, initialChildren: children);

  static const String name = 'MyChallengesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyChallengesScreen();
    },
  );
}

/// generated route for
/// [MyChampionshipsScreen]
class MyChampionshipsRoute extends PageRouteInfo<void> {
  const MyChampionshipsRoute({List<PageRouteInfo>? children})
    : super(MyChampionshipsRoute.name, initialChildren: children);

  static const String name = 'MyChampionshipsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyChampionshipsScreen();
    },
  );
}

/// generated route for
/// [MyOrderDetailsScreen]
class MyOrderDetailsRoute extends PageRouteInfo<MyOrderDetailsRouteArgs> {
  MyOrderDetailsRoute({
    Key? key,
    required int orderId,
    List<PageRouteInfo>? children,
  }) : super(
         MyOrderDetailsRoute.name,
         args: MyOrderDetailsRouteArgs(key: key, orderId: orderId),
         initialChildren: children,
       );

  static const String name = 'MyOrderDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyOrderDetailsRouteArgs>();
      return MyOrderDetailsScreen(key: args.key, orderId: args.orderId);
    },
  );
}

class MyOrderDetailsRouteArgs {
  const MyOrderDetailsRouteArgs({this.key, required this.orderId});

  final Key? key;

  final int orderId;

  @override
  String toString() {
    return 'MyOrderDetailsRouteArgs{key: $key, orderId: $orderId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyOrderDetailsRouteArgs) return false;
    return key == other.key && orderId == other.orderId;
  }

  @override
  int get hashCode => key.hashCode ^ orderId.hashCode;
}

/// generated route for
/// [MyOrdersScreen]
class MyOrdersRoute extends PageRouteInfo<void> {
  const MyOrdersRoute({List<PageRouteInfo>? children})
    : super(MyOrdersRoute.name, initialChildren: children);

  static const String name = 'MyOrdersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyOrdersScreen();
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
class PartnerChatRoute extends PageRouteInfo<PartnerChatRouteArgs> {
  PartnerChatRoute({
    Key? key,
    required String peerId,
    String? peerName,
    String? peerAvatar,
    String? peerPhone,
    List<PageRouteInfo>? children,
  }) : super(
         PartnerChatRoute.name,
         args: PartnerChatRouteArgs(
           key: key,
           peerId: peerId,
           peerName: peerName,
           peerAvatar: peerAvatar,
           peerPhone: peerPhone,
         ),
         initialChildren: children,
       );

  static const String name = 'PartnerChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PartnerChatRouteArgs>();
      return PartnerChatScreen(
        key: args.key,
        peerId: args.peerId,
        peerName: args.peerName,
        peerAvatar: args.peerAvatar,
        peerPhone: args.peerPhone,
      );
    },
  );
}

class PartnerChatRouteArgs {
  const PartnerChatRouteArgs({
    this.key,
    required this.peerId,
    this.peerName,
    this.peerAvatar,
    this.peerPhone,
  });

  final Key? key;

  final String peerId;

  final String? peerName;

  final String? peerAvatar;

  final String? peerPhone;

  @override
  String toString() {
    return 'PartnerChatRouteArgs{key: $key, peerId: $peerId, peerName: $peerName, peerAvatar: $peerAvatar, peerPhone: $peerPhone}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PartnerChatRouteArgs) return false;
    return key == other.key &&
        peerId == other.peerId &&
        peerName == other.peerName &&
        peerAvatar == other.peerAvatar &&
        peerPhone == other.peerPhone;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      peerId.hashCode ^
      peerName.hashCode ^
      peerAvatar.hashCode ^
      peerPhone.hashCode;
}

/// generated route for
/// [PartnerDetailsScreen]
class PartnerDetailsRoute extends PageRouteInfo<PartnerDetailsRouteArgs> {
  PartnerDetailsRoute({
    Key? key,
    required int userId,
    required String name,
    String? avatar,
    List<PageRouteInfo>? children,
  }) : super(
         PartnerDetailsRoute.name,
         args: PartnerDetailsRouteArgs(
           key: key,
           userId: userId,
           name: name,
           avatar: avatar,
         ),
         initialChildren: children,
       );

  static const String name = 'PartnerDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PartnerDetailsRouteArgs>();
      return PartnerDetailsScreen(
        key: args.key,
        userId: args.userId,
        name: args.name,
        avatar: args.avatar,
      );
    },
  );
}

class PartnerDetailsRouteArgs {
  const PartnerDetailsRouteArgs({
    this.key,
    required this.userId,
    required this.name,
    this.avatar,
  });

  final Key? key;

  final int userId;

  final String name;

  final String? avatar;

  @override
  String toString() {
    return 'PartnerDetailsRouteArgs{key: $key, userId: $userId, name: $name, avatar: $avatar}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PartnerDetailsRouteArgs) return false;
    return key == other.key &&
        userId == other.userId &&
        name == other.name &&
        avatar == other.avatar;
  }

  @override
  int get hashCode =>
      key.hashCode ^ userId.hashCode ^ name.hashCode ^ avatar.hashCode;
}

/// generated route for
/// [PartnerReviewsScreen]
class PartnerReviewsRoute extends PageRouteInfo<PartnerReviewsRouteArgs> {
  PartnerReviewsRoute({
    Key? key,
    required int partnerId,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
         PartnerReviewsRoute.name,
         args: PartnerReviewsRouteArgs(
           key: key,
           partnerId: partnerId,
           title: title,
         ),
         initialChildren: children,
       );

  static const String name = 'PartnerReviewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PartnerReviewsRouteArgs>();
      return PartnerReviewsScreen(
        key: args.key,
        partnerId: args.partnerId,
        title: args.title,
      );
    },
  );
}

class PartnerReviewsRouteArgs {
  const PartnerReviewsRouteArgs({
    this.key,
    required this.partnerId,
    this.title,
  });

  final Key? key;

  final int partnerId;

  final String? title;

  @override
  String toString() {
    return 'PartnerReviewsRouteArgs{key: $key, partnerId: $partnerId, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PartnerReviewsRouteArgs) return false;
    return key == other.key &&
        partnerId == other.partnerId &&
        title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ partnerId.hashCode ^ title.hashCode;
}

/// generated route for
/// [PartnerVideosScreen]
class PartnerVideosRoute extends PageRouteInfo<PartnerVideosRouteArgs> {
  PartnerVideosRoute({
    Key? key,
    required int partnerId,
    String? title,
    bool canDelete = false,
    List<PageRouteInfo>? children,
  }) : super(
         PartnerVideosRoute.name,
         args: PartnerVideosRouteArgs(
           key: key,
           partnerId: partnerId,
           title: title,
           canDelete: canDelete,
         ),
         initialChildren: children,
       );

  static const String name = 'PartnerVideosRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PartnerVideosRouteArgs>();
      return PartnerVideosScreen(
        key: args.key,
        partnerId: args.partnerId,
        title: args.title,
        canDelete: args.canDelete,
      );
    },
  );
}

class PartnerVideosRouteArgs {
  const PartnerVideosRouteArgs({
    this.key,
    required this.partnerId,
    this.title,
    this.canDelete = false,
  });

  final Key? key;

  final int partnerId;

  final String? title;

  final bool canDelete;

  @override
  String toString() {
    return 'PartnerVideosRouteArgs{key: $key, partnerId: $partnerId, title: $title, canDelete: $canDelete}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PartnerVideosRouteArgs) return false;
    return key == other.key &&
        partnerId == other.partnerId &&
        title == other.title &&
        canDelete == other.canDelete;
  }

  @override
  int get hashCode =>
      key.hashCode ^ partnerId.hashCode ^ title.hashCode ^ canDelete.hashCode;
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
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [ReserveNowScreen]
class ReserveNowRoute extends PageRouteInfo<ReserveNowRouteArgs> {
  ReserveNowRoute({
    Key? key,
    int stadiumId = 0,
    String? date,
    List<PageRouteInfo>? children,
  }) : super(
         ReserveNowRoute.name,
         args: ReserveNowRouteArgs(key: key, stadiumId: stadiumId, date: date),
         initialChildren: children,
       );

  static const String name = 'ReserveNowRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReserveNowRouteArgs>(
        orElse: () => const ReserveNowRouteArgs(),
      );
      return ReserveNowScreen(
        key: args.key,
        stadiumId: args.stadiumId,
        date: args.date,
      );
    },
  );
}

class ReserveNowRouteArgs {
  const ReserveNowRouteArgs({this.key, this.stadiumId = 0, this.date});

  final Key? key;

  final int stadiumId;

  final String? date;

  @override
  String toString() {
    return 'ReserveNowRouteArgs{key: $key, stadiumId: $stadiumId, date: $date}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReserveNowRouteArgs) return false;
    return key == other.key &&
        stadiumId == other.stadiumId &&
        date == other.date;
  }

  @override
  int get hashCode => key.hashCode ^ stadiumId.hashCode ^ date.hashCode;
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
class StadiumProfileRoute extends PageRouteInfo<StadiumProfileRouteArgs> {
  StadiumProfileRoute({
    Key? key,
    required int stadiumId,
    List<PageRouteInfo>? children,
  }) : super(
         StadiumProfileRoute.name,
         args: StadiumProfileRouteArgs(key: key, stadiumId: stadiumId),
         initialChildren: children,
       );

  static const String name = 'StadiumProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StadiumProfileRouteArgs>();
      return StadiumProfileScreen(key: args.key, stadiumId: args.stadiumId);
    },
  );
}

class StadiumProfileRouteArgs {
  const StadiumProfileRouteArgs({this.key, required this.stadiumId});

  final Key? key;

  final int stadiumId;

  @override
  String toString() {
    return 'StadiumProfileRouteArgs{key: $key, stadiumId: $stadiumId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StadiumProfileRouteArgs) return false;
    return key == other.key && stadiumId == other.stadiumId;
  }

  @override
  int get hashCode => key.hashCode ^ stadiumId.hashCode;
}

/// generated route for
/// [TeamProfileScreen]
class TeamProfileRoute extends PageRouteInfo<TeamProfileRouteArgs> {
  TeamProfileRoute({
    Key? key,
    required int teamId,
    List<PageRouteInfo>? children,
  }) : super(
         TeamProfileRoute.name,
         args: TeamProfileRouteArgs(key: key, teamId: teamId),
         initialChildren: children,
       );

  static const String name = 'TeamProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeamProfileRouteArgs>();
      return TeamProfileScreen(key: args.key, teamId: args.teamId);
    },
  );
}

class TeamProfileRouteArgs {
  const TeamProfileRouteArgs({this.key, required this.teamId});

  final Key? key;

  final int teamId;

  @override
  String toString() {
    return 'TeamProfileRouteArgs{key: $key, teamId: $teamId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TeamProfileRouteArgs) return false;
    return key == other.key && teamId == other.teamId;
  }

  @override
  int get hashCode => key.hashCode ^ teamId.hashCode;
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

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    Key? key,
    required LoginCubit cubit,
    List<PageRouteInfo>? children,
  }) : super(
         VerificationRoute.name,
         args: VerificationRouteArgs(key: key, cubit: cubit),
         initialChildren: children,
       );

  static const String name = 'VerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return VerificationScreen(key: args.key, cubit: args.cubit);
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, required this.cubit});

  final Key? key;

  final LoginCubit cubit;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, cubit: $cubit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerificationRouteArgs) return false;
    return key == other.key && cubit == other.cubit;
  }

  @override
  int get hashCode => key.hashCode ^ cubit.hashCode;
}
