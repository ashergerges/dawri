// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamMiniModel _$TeamMiniModelFromJson(Map<String, dynamic> json) =>
    TeamMiniModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$TeamMiniModelToJson(TeamMiniModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

UpcomingMatchModel _$UpcomingMatchModelFromJson(Map<String, dynamic> json) =>
    UpcomingMatchModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      home: json['home'] == null
          ? null
          : TeamMiniModel.fromJson(json['home'] as Map<String, dynamic>),
      away: json['away'] == null
          ? null
          : TeamMiniModel.fromJson(json['away'] as Map<String, dynamic>),
      dateText: json['date_text'] as String?,
      time: json['time'] as String?,
      stadium: json['stadium_name'] as String?,
      remainingTickets: (json['remaining_tickets'] as num?)?.toInt(),
      isSoldOut: json['is_sold_out'] as bool?,
      ticketPrice: json['ticket_price'] as num?,
      isFree: json['is_free'] as bool?,
    );

Map<String, dynamic> _$UpcomingMatchModelToJson(UpcomingMatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'home': instance.home,
      'away': instance.away,
      'date_text': instance.dateText,
      'time': instance.time,
      'stadium': instance.stadium,
      'remaining_tickets': instance.remainingTickets,
      'is_sold_out': instance.isSoldOut,
      'ticket_price': instance.ticketPrice,
      'is_free': instance.isFree,
    };

TicketStatusModel _$TicketStatusModelFromJson(Map<String, dynamic> json) =>
    TicketStatusModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$TicketStatusModelToJson(TicketStatusModel instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

TicketMatchModel _$TicketMatchModelFromJson(Map<String, dynamic> json) =>
    TicketMatchModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      home: json['home'] == null
          ? null
          : TeamMiniModel.fromJson(json['home'] as Map<String, dynamic>),
      away: json['away'] == null
          ? null
          : TeamMiniModel.fromJson(json['away'] as Map<String, dynamic>),
      stadium: json['stadium'] as String?,
      dateText: json['date_text'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$TicketMatchModelToJson(TicketMatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'home': instance.home,
      'away': instance.away,
      'stadium': instance.stadium,
      'date_text': instance.dateText,
      'time': instance.time,
    };

MyTicketModel _$MyTicketModelFromJson(Map<String, dynamic> json) =>
    MyTicketModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      qrPayload: json['qr_payload'] as String?,
      seat: json['seat'] as String?,
      gate: json['gate'] as String?,
      price: json['price'] as num?,
      status: json['status'] == null
          ? null
          : TicketStatusModel.fromJson(json['status'] as Map<String, dynamic>),
      match: json['match'] == null
          ? null
          : TicketMatchModel.fromJson(json['match'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyTicketModelToJson(MyTicketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'qr_payload': instance.qrPayload,
      'seat': instance.seat,
      'gate': instance.gate,
      'price': instance.price,
      'status': instance.status,
      'match': instance.match,
    };
