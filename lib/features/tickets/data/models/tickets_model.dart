// lib/features/tickets/data/tickets_model.dart
class UpcomingMatchModel {
  final String id;
  final String? badgeKey;
  final String teamAName;
  final String teamALogoUrl;
  final String teamBName;
  final String teamBLogoUrl;
  final String dateLabelKey;
  final String timeLabelKey;
  final String venueLabelKey;
  final String? seatsLeftLabelKey;
  final bool isFree;
  final double? price;

  const UpcomingMatchModel({
    required this.id,
    this.badgeKey,
    required this.teamAName,
    required this.teamALogoUrl,
    required this.teamBName,
    required this.teamBLogoUrl,
    required this.dateLabelKey,
    required this.timeLabelKey,
    required this.venueLabelKey,
    this.seatsLeftLabelKey,
    this.isFree = false,
    this.price,
  });
}

class MyTicketModel {
  final String id;
  final String tournamentName;
  final String venue;
  final String statusKey;
  final String teamAName;
  final String teamBName;
  final String dateLabelKey;
  final String timeLabelKey;
  final String gate;
  final String seat;
  final String qrData;

  const MyTicketModel({
    required this.id,
    required this.tournamentName,
    required this.venue,
    required this.statusKey,
    required this.teamAName,
    required this.teamBName,
    required this.dateLabelKey,
    required this.timeLabelKey,
    required this.gate,
    required this.seat,
    required this.qrData,
  });
}

class TicketsMockData {
  static const upcomingMatches = [
    UpcomingMatchModel(
      id: 'match-1',
      badgeKey: 'ticketsFinalBadge',
      teamAName: 'الصقور',
      teamALogoUrl: 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      teamBName: 'أكاديمية المجد',
      teamBLogoUrl: 'https://images.unsplash.com/photo-1522778119026-d647f0596c20?w=100&q=80',
      dateLabelKey: 'ticketsMatch1Date',
      timeLabelKey: 'ticketsMatch1Time',
      venueLabelKey: 'ticketsMatch1Venue',
      seatsLeftLabelKey: 'ticketsMatch1Seats',
      price: 35,
    ),
    UpcomingMatchModel(
      id: 'match-2',
      teamAName: 'شباب الرياض',
      teamALogoUrl: 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      teamBName: 'اتحاد طويق',
      teamBLogoUrl: 'https://images.unsplash.com/photo-1522778119026-d647f0596c20?w=100&q=80',
      dateLabelKey: 'ticketsMatch2Date',
      timeLabelKey: 'ticketsMatch2Time',
      venueLabelKey: 'ticketsMatch2Venue',
      isFree: true,
    ),
  ];

  static const myTickets = [
    MyTicketModel(
      id: 'ticket-1',
      tournamentName: 'نهائي دوري الأحياء',
      venue: 'ملعب أرينا الرياض',
      statusKey: 'ticketsStatusValid',
      teamAName: 'الصقور',
      teamBName: 'أكاديمية المجد',
      dateLabelKey: '20 نوفمبر',
      timeLabelKey: '08:30 م',
      gate: 'Gate 4',
      seat: 'B-12',
      qrData: 'Ticket-DW-8492',
    ),
  ];
}