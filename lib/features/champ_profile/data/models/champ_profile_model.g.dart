// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champ_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampRefModel _$ChampRefModelFromJson(Map<String, dynamic> json) =>
    ChampRefModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ChampRefModelToJson(ChampRefModel instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

SportTypeModel _$SportTypeModelFromJson(Map<String, dynamic> json) =>
    SportTypeModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$SportTypeModelToJson(SportTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
    };

OrganizerModel _$OrganizerModelFromJson(Map<String, dynamic> json) =>
    OrganizerModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      rating: json['rating'] as num?,
      previousChampionshipsCount: (json['previous_championships_count'] as num?)
          ?.toInt(),
    );

Map<String, dynamic> _$OrganizerModelToJson(OrganizerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'rating': instance.rating,
      'previous_championships_count': instance.previousChampionshipsCount,
    };

ChampionshipDetailsModel _$ChampionshipDetailsModelFromJson(
  Map<String, dynamic> json,
) => ChampionshipDetailsModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  coverImage: json['cover_image'] as String?,
  image: json['image'] as String?,
  status: json['status'] == null
      ? null
      : ChampRefModel.fromJson(json['status'] as Map<String, dynamic>),
  isFavorite: json['is_favorite'] as bool?,
  isRegistered: json['is_registered'] as bool?,
  canRegister: json['can_register'] as bool?,
  address: json['address'] as String?,
  city: json['city'] as String?,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  sportType: json['sport_type'] == null
      ? null
      : SportTypeModel.fromJson(json['sport_type'] as Map<String, dynamic>),
  registrationMode: json['registration_mode'] == null
      ? null
      : ChampRefModel.fromJson(
          json['registration_mode'] as Map<String, dynamic>,
        ),
  requiredParticipants: (json['required_participants'] as num?)?.toInt(),
  registeredParticipants: (json['registered_participants'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  registeredParticipantsCount: (json['registered_participants_count'] as num?)
      ?.toInt(),
  championshipType: json['championship_type'] == null
      ? null
      : ChampRefModel.fromJson(
          json['championship_type'] as Map<String, dynamic>,
        ),
  entryFee: json['entry_fee'] as num?,
  about: json['about'] as String?,
  prizeMoney: json['prize_money'] as num?,
  prizeMoneyForFirst: json['prize_money_for_first'] as String?,
  prizeMoneyForSecond: json['prize_money_for_second'] as String?,
  organizer: json['organizer'] == null
      ? null
      : OrganizerModel.fromJson(json['organizer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChampionshipDetailsModelToJson(
  ChampionshipDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'cover_image': instance.coverImage,
  'image': instance.image,
  'status': instance.status,
  'is_favorite': instance.isFavorite,
  'can_register': instance.canRegister,
  'is_registered': instance.isRegistered,
  'address': instance.address,
  'city': instance.city,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'sport_type': instance.sportType,
  'registration_mode': instance.registrationMode,
  'required_participants': instance.requiredParticipants,
  'registered_participants': instance.registeredParticipants,
  'registered_participants_count': instance.registeredParticipantsCount,
  'championship_type': instance.championshipType,
  'entry_fee': instance.entryFee,
  'about': instance.about,
  'prize_money': instance.prizeMoney,
  'prize_money_for_first': instance.prizeMoneyForFirst,
  'prize_money_for_second': instance.prizeMoneyForSecond,
  'organizer': instance.organizer,
};
