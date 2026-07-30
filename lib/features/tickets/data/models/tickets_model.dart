import 'package:json_annotation/json_annotation.dart';

part 'tickets_model.g.dart';

@JsonSerializable()
class TeamMiniModel {
  final int? id;
  final String? name;
  final String? logo;

  TeamMiniModel({this.id, this.name, this.logo});

  factory TeamMiniModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMiniModelFromJson(json);
  Map<String, dynamic> toJson() => _$TeamMiniModelToJson(this);
}

@JsonSerializable()
class UpcomingMatchModel {
  final int? id;
  final String? title;
  final TeamMiniModel? home;
  final TeamMiniModel? away;
  @JsonKey(name: 'date_text')
  final String? dateText;
  final String? time;
  @JsonKey(name: 'stadium_name')
  final String? stadium;
  @JsonKey(name: 'remaining_tickets')
  final int? remainingTickets;
  @JsonKey(name: 'is_sold_out')
  final bool? isSoldOut;
  @JsonKey(name: 'ticket_price')
  final num? ticketPrice;
  @JsonKey(name: 'is_free')
  final bool? isFree;

  UpcomingMatchModel({
    this.id,
    this.title,
    this.home,
    this.away,
    this.dateText,
    this.time,
    this.stadium,
    this.remainingTickets,
    this.isSoldOut,
    this.ticketPrice,
    this.isFree,
  });

  factory UpcomingMatchModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpcomingMatchModelToJson(this);
}

@JsonSerializable()
class TicketStatusModel {
  final int? id;
  final String? title;

  TicketStatusModel({this.id, this.title});

  factory TicketStatusModel.fromJson(Map<String, dynamic> json) =>
      _$TicketStatusModelFromJson(json);
  Map<String, dynamic> toJson() => _$TicketStatusModelToJson(this);
}

@JsonSerializable()
class TicketMatchModel {
  final int? id;
  final String? title;
  final TeamMiniModel? home;
  final TeamMiniModel? away;
  final String? stadium;
  @JsonKey(name: 'date_text')
  final String? dateText;
  final String? time;

  TicketMatchModel({
    this.id,
    this.title,
    this.home,
    this.away,
    this.stadium,
    this.dateText,
    this.time,
  });

  factory TicketMatchModel.fromJson(Map<String, dynamic> json) =>
      _$TicketMatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$TicketMatchModelToJson(this);
}

@JsonSerializable()
class MyTicketModel {
  final int? id;
  final String? code;
  @JsonKey(name: 'qr_payload')
  final String? qrPayload;
  final String? seat;
  final String? gate;
  final num? price;
  final TicketStatusModel? status;
  final TicketMatchModel? match;

  MyTicketModel({
    this.id,
    this.code,
    this.qrPayload,
    this.seat,
    this.gate,
    this.price,
    this.status,
    this.match,
  });

  factory MyTicketModel.fromJson(Map<String, dynamic> json) =>
      _$MyTicketModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyTicketModelToJson(this);
}