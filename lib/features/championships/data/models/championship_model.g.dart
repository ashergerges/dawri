// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionshipStatusModel _$ChampionshipStatusModelFromJson(
  Map<String, dynamic> json,
) => ChampionshipStatusModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$ChampionshipStatusModelToJson(
  ChampionshipStatusModel instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};

ChampionshipModel _$ChampionshipModelFromJson(Map<String, dynamic> json) =>
    ChampionshipModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      coverImage: json['cover_image'] as String?,
      image: json['image'] as String?,
      sportType: json['sport_type'] == null
          ? null
          : SportModel.fromJson(json['sport_type'] as Map<String, dynamic>),
      type: json['championship_type'] == null
          ? null
          : ChampionshipTypeModel.fromJson(
              json['championship_type'] as Map<String, dynamic>,
            ),
      status: json['status'] == null
          ? null
          : ChampionshipStatusModel.fromJson(
              json['status'] as Map<String, dynamic>,
            ),
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      registrationMode: json['registration_mode'] == null
          ? null
          : RegistrationModeModel.fromJson(
              json['registration_mode'] as Map<String, dynamic>,
            ),
      registeredTeamsCount: (json['registered_teams_count'] as num?)?.toInt(),
      registeredTeams: (json['registered_teams'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      entryFee: (json['entry_fee'] as num?)?.toInt(),
      requiredTeams: (json['required_teams'] as num?)?.toInt(),
      prizeMoneyForFirst: ChampionshipModel._stringToDouble(
        json['prize_money_for_first'],
      ),
      prizeMoneyForSecond: ChampionshipModel._stringToDouble(
        json['prize_money_for_second'],
      ),
      organizer: json['organizer'] == null
          ? null
          : OrganizerModel.fromJson(json['organizer'] as Map<String, dynamic>),
      isFavorite: json['is_favorite'] as bool?,
    );

Map<String, dynamic> _$ChampionshipModelToJson(ChampionshipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover_image': instance.coverImage,
      'image': instance.image,
      'sport_type': instance.sportType,
      'championship_type': instance.type,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'address': instance.address,
      'city': instance.city,
      'registration_mode': instance.registrationMode,
      'registered_teams_count': instance.registeredTeamsCount,
      'registered_teams': instance.registeredTeams,
      'entry_fee': instance.entryFee,
      'required_teams': instance.requiredTeams,
      'prize_money_for_first': instance.prizeMoneyForFirst,
      'prize_money_for_second': instance.prizeMoneyForSecond,
      'organizer': instance.organizer,
      'is_favorite': instance.isFavorite,
    };

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      currentPage: (json['current_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalItems: (json['total_items'] as num?)?.toInt(),
      hasNext: json['has_next'] as bool?,
      hasPrev: json['has_prev'] as bool?,
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'total_pages': instance.totalPages,
      'total_items': instance.totalItems,
      'has_next': instance.hasNext,
      'has_prev': instance.hasPrev,
    };
