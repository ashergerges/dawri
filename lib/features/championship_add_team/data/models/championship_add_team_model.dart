class PlayerModel {
  final String name;
  final String positionKey;
  final String avatarUrl;
  final bool isCaptain;

  const PlayerModel({
    required this.name,
    required this.positionKey,
    required this.avatarUrl,
    this.isCaptain = false,
  });
}

class ChampionshipAddTeamMockData {
  static const minPlayersRequired = 3;
  static const registrationFee = 500;

  static const teamName = 'نادي الصقور الرياضي';
  static const teamLogoUrl =
      'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80';
  static const teamTotalPlayers = 18;

  static const tournamentName = 'دوري نجوم الأحياء 2026';
  static const tournamentMeta = 'كرة قدم • 15 نوفمبر 2026';

  static const players = [
    PlayerModel(
      name: 'فهد الدوسري',
      positionKey: 'مهاجم',
      avatarUrl: 'https://i.pravatar.cc/150?img=33',
      isCaptain: true,
    ),
    PlayerModel(
      name: 'سالم المطيري',
      positionKey: 'وسط صانع ألعاب',
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
    ),
    PlayerModel(
      name: 'عبدالله العمر',
      positionKey: 'حارس مرمى',
      avatarUrl: 'https://i.pravatar.cc/150?img=59',
    ),
    PlayerModel(
      name: 'خالد الشمري',
      positionKey: 'مدافع',
      avatarUrl: 'https://i.pravatar.cc/150?img=12',
    ),
  ];
}