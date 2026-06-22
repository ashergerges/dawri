import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum ParticipantRole { player, teamRep, coach, referee }

class RoleChipData {
  final ParticipantRole role;
  final IconData icon;
  final String labelKey;

  const RoleChipData({required this.role, required this.icon, required this.labelKey});
}

class RegionOption {
  final String value;
  final String labelKey;

  const RegionOption({required this.value, required this.labelKey});
}

class ChampionshipRegisterMockData {
  static const tournamentName = 'دوري نجوم الأحياء 2026';

  static const roles = [
    RoleChipData(
      role: ParticipantRole.player,
      icon: FontAwesomeIcons.personRunning,
      labelKey: LocaleKeys.registerRolePlayer,
    ),
    RoleChipData(
      role: ParticipantRole.teamRep,
      icon: FontAwesomeIcons.users,
      labelKey: LocaleKeys.registerRoleTeamRep,
    ),
    RoleChipData(
      role: ParticipantRole.coach,
      icon: FontAwesomeIcons.stopwatch,
      labelKey: LocaleKeys.registerRoleCoach,
    ),
    RoleChipData(
      role: ParticipantRole.referee,
      icon: FontAwesomeIcons.flag,
      labelKey: LocaleKeys.registerRoleReferee,
    ),
  ];

  static const regions = [
    RegionOption(value: 'riyadh', labelKey: LocaleKeys.registerRegionRiyadh),
    RegionOption(value: 'makkah', labelKey: LocaleKeys.registerRegionMakkah),
    RegionOption(value: 'jeddah', labelKey: LocaleKeys.registerRegionJeddah),
    RegionOption(value: 'dammam', labelKey: LocaleKeys.registerRegionDammam),
  ];
}