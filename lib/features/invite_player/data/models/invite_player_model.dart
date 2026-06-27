// lib/features/invite_player/data/invite_player_model.dart
import 'package:dawri/gen/locale_keys.g.dart';

enum PlayerFilter { all, striker, midfielder, defender, goalkeeper }

enum InviteStatus { idle, sending, sent }

class FilterChipData {
  final PlayerFilter filter;
  final String labelKey;

  const FilterChipData({required this.filter, required this.labelKey});
}

class ScoutedPlayerData {
  final String id;
  final String imageUrl;
  final String nameKey;
  final String roleKey;
  final double rating;
  final PlayerFilter filter;

  const ScoutedPlayerData({
    required this.id,
    required this.imageUrl,
    required this.nameKey,
    required this.roleKey,
    required this.rating,
    required this.filter,
  });
}

class InvitePlayerMockData {
  static const teamNameKey = LocaleKeys.invitePlayerTeamName;

  static const filterChips = [
    FilterChipData(filter: PlayerFilter.all, labelKey: LocaleKeys.invitePlayerFilterAll),
    FilterChipData(filter: PlayerFilter.striker, labelKey: LocaleKeys.invitePlayerFilterStriker),
    FilterChipData(filter: PlayerFilter.midfielder, labelKey: LocaleKeys.invitePlayerFilterMidfielder),
    FilterChipData(filter: PlayerFilter.defender, labelKey: LocaleKeys.invitePlayerFilterDefender),
    FilterChipData(filter: PlayerFilter.goalkeeper, labelKey: LocaleKeys.invitePlayerFilterGoalkeeper),
  ];

  static const scoutedPlayers = [
    ScoutedPlayerData(
      id: 'scout-1',
      imageUrl: 'https://i.pravatar.cc/150?img=11',
      nameKey: LocaleKeys.invitePlayerScout1Name,
      roleKey: LocaleKeys.invitePlayerScout1Role,
      rating: 4.8,
      filter: PlayerFilter.midfielder,
    ),
    ScoutedPlayerData(
      id: 'scout-2',
      imageUrl: 'https://i.pravatar.cc/150?img=14',
      nameKey: LocaleKeys.invitePlayerScout2Name,
      roleKey: LocaleKeys.invitePlayerScout2Role,
      rating: 4.5,
      filter: PlayerFilter.defender,
    ),
    ScoutedPlayerData(
      id: 'scout-3',
      imageUrl: 'https://i.pravatar.cc/150?img=59',
      nameKey: LocaleKeys.invitePlayerScout3Name,
      roleKey: LocaleKeys.invitePlayerScout3Role,
      rating: 4.9,
      filter: PlayerFilter.striker,
    ),
    ScoutedPlayerData(
      id: 'scout-4',
      imageUrl: 'https://i.pravatar.cc/150?img=33',
      nameKey: LocaleKeys.invitePlayerScout4Name,
      roleKey: LocaleKeys.invitePlayerScout4Role,
      rating: 4.2,
      filter: PlayerFilter.goalkeeper,
    ),
  ];
}