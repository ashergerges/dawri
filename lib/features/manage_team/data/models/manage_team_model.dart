// lib/features/manage_team/data/manage_team_model.dart
import 'package:dawri/gen/locale_keys.g.dart';

enum ManageTeamTab { roster, requests }

class TeamStatData {
  final String value;
  final String labelKey;
  final bool isHighlighted;

  const TeamStatData({required this.value, required this.labelKey, this.isHighlighted = false});
}

class PlayerCardData {
  final String id;
  final String imageUrl;
  final String nameKey;
  final String roleKey;
  final bool isCaptain;

  const PlayerCardData({
    required this.id,
    required this.imageUrl,
    required this.nameKey,
    required this.roleKey,
    this.isCaptain = false,
  });
}

class PendingRequestData {
  final String id;
  final String imageUrl;
  final String nameKey;
  final String roleKey;
  final double rating;

  const PendingRequestData({
    required this.id,
    required this.imageUrl,
    required this.nameKey,
    required this.roleKey,
    required this.rating,
  });
}

class ManageTeamMockData {
  static const teamLogoUrl = 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=150&q=80';
  static const teamNameKey = LocaleKeys.manageTeamName;
  static const teamSportKey = LocaleKeys.manageTeamSport;

  static const teamStats = [
    TeamStatData(value: '18', labelKey: LocaleKeys.manageTeamStatPlayers),
    TeamStatData(value: '34', labelKey: LocaleKeys.manageTeamStatMatches),
    TeamStatData(value: '4.8', labelKey: LocaleKeys.manageTeamStatRating, isHighlighted: true),
  ];

  static const roster = [
    PlayerCardData(
      id: 'player-1',
      imageUrl: 'https://i.pravatar.cc/150?img=33',
      nameKey: LocaleKeys.manageTeamPlayer1Name,
      roleKey: LocaleKeys.manageTeamPlayer1Role,
      isCaptain: true,
    ),
    PlayerCardData(
      id: 'player-2',
      imageUrl: 'https://i.pravatar.cc/150?img=11',
      nameKey: LocaleKeys.manageTeamPlayer2Name,
      roleKey: LocaleKeys.manageTeamPlayer2Role,
    ),
    PlayerCardData(
      id: 'player-3',
      imageUrl: 'https://i.pravatar.cc/150?img=59',
      nameKey: LocaleKeys.manageTeamPlayer3Name,
      roleKey: LocaleKeys.manageTeamPlayer3Role,
    ),
  ];

  static const pendingRequests = [
    PendingRequestData(
      id: 'req-1',
      imageUrl: 'https://i.pravatar.cc/150?img=12',
      nameKey: LocaleKeys.manageTeamRequest1Name,
      roleKey: LocaleKeys.manageTeamRequest1Role,
      rating: 4.5,
    ),
    PendingRequestData(
      id: 'req-2',
      imageUrl: 'https://i.pravatar.cc/150?img=15',
      nameKey: LocaleKeys.manageTeamRequest2Name,
      roleKey: LocaleKeys.manageTeamRequest2Role,
      rating: 4.2,
    ),
  ];
}