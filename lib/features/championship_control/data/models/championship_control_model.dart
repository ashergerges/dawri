// lib/features/championship_control/data/championship_control_model.dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dawri/gen/locale_keys.g.dart';

// ─── Pending Request ──────────────────────────────────────────────────────
class PendingRequest {
  final String id;
  final String teamName;
  final String captain;
  final String imageUrl;
  final DateTime requestedAt;

  const PendingRequest({
    required this.id,
    required this.teamName,
    required this.captain,
    required this.imageUrl,
    required this.requestedAt,
  });
}

// ─── Approved Team ────────────────────────────────────────────────────────
class ApprovedTeam {
  final String id;
  final String name;
  final String captain;
  final DateTime joinDate;
  final String? imageUrl;

  const ApprovedTeam({
    required this.id,
    required this.name,
    required this.captain,
    required this.joinDate,
    this.imageUrl,
  });

  ApprovedTeam copyWith({
    String? id,
    String? name,
    String? captain,
    DateTime? joinDate,
    String? imageUrl,
  }) {
    return ApprovedTeam(
      id: id ?? this.id,
      name: name ?? this.name,
      captain: captain ?? this.captain,
      joinDate: joinDate ?? this.joinDate,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

// ─── Match ─────────────────────────────────────────────────────────────────
class Match {
  final String id;
  final String team1Name;
  final String team1Image;
  final String team2Name;
  final String team2Image;
  final int? score1;
  final int? score2;
  final bool isFinished;
  final String time;
  final String stadium;
  final DateTime dateTime;

  const Match({
    required this.id,
    required this.team1Name,
    required this.team1Image,
    required this.team2Name,
    required this.team2Image,
    this.score1,
    this.score2,
    this.isFinished = false,
    required this.time,
    required this.stadium,
    required this.dateTime,
  });

  Match copyWith({
    String? id,
    String? team1Name,
    String? team1Image,
    String? team2Name,
    String? team2Image,
    int? score1,
    int? score2,
    bool? isFinished,
    String? time,
    String? stadium,
    DateTime? dateTime,
  }) {
    return Match(
      id: id ?? this.id,
      team1Name: team1Name ?? this.team1Name,
      team1Image: team1Image ?? this.team1Image,
      team2Name: team2Name ?? this.team2Name,
      team2Image: team2Image ?? this.team2Image,
      score1: score1 ?? this.score1,
      score2: score2 ?? this.score2,
      isFinished: isFinished ?? this.isFinished,
      time: time ?? this.time,
      stadium: stadium ?? this.stadium,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}

// ─── Mock Data ─────────────────────────────────────────────────────────────
class ChampionshipControlMockData {
  static const tournamentName = 'كأس أبطال الرياض';
  static const tournamentLogo =
      'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=150&q=80';
  static const tournamentStatus = LocaleKeys.championshipControlStatus;

  static List<PendingRequest> get pendingRequests =>  [
    PendingRequest(
      id: 'req-1',
      teamName: 'نادي الصقور',
      captain: 'فهد الدوسري',
      imageUrl:
      'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      requestedAt: DateTime.now(),
    ),
    PendingRequest(
      id: 'req-2',
      teamName: 'أكاديمية المجد',
      captain: 'سالم المطيري',
      imageUrl:
      'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=100&q=80',
      requestedAt: DateTime.now(),
    ),
  ];

  static List<ApprovedTeam> get approvedTeams =>  [
    ApprovedTeam(
      id: 'team-1',
      name: 'نادي الاتحاد',
      captain: 'أحمد الغامدي',
      joinDate: DateTime(2026, 6, 10),
    ),
    ApprovedTeam(
      id: 'team-2',
      name: 'نادي الشباب',
      captain: 'خالد الزهراني',
      joinDate: DateTime(2026, 6, 11),
    ),
  ];

  static List<Match> get matches => [
    Match(
      id: 'match-1',
      team1Name: 'الصقور',
      team1Image:
      'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      team2Name: 'الزعيم',
      team2Image:
      'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=100&q=80',
      time: 'الليلة، 09:00 م',
      stadium: 'ملعب أرينا الرياض',
      dateTime: DateTime.now().add(const Duration(hours: 3)),
    ),
    Match(
      id: 'match-2',
      team1Name: 'الاتحاد',
      team1Image:
      'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      team2Name: 'الشباب',
      team2Image:
      'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=100&q=80',
      score1: 3,
      score2: 1,
      isFinished: true,
      time: 'انتهت',
      stadium: 'الأمس',
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];
}