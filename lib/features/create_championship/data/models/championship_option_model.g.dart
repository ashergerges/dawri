// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SportModel _$SportModelFromJson(Map<String, dynamic> json) => SportModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$SportModelToJson(SportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
    };

ChampionshipTypeModel _$ChampionshipTypeModelFromJson(
  Map<String, dynamic> json,
) => ChampionshipTypeModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$ChampionshipTypeModelToJson(
  ChampionshipTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'icon': instance.icon,
};

RegistrationModeModel _$RegistrationModeModelFromJson(
  Map<String, dynamic> json,
) => RegistrationModeModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$RegistrationModeModelToJson(
  RegistrationModeModel instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
};

OrganizerModel _$OrganizerModelFromJson(Map<String, dynamic> json) =>
    OrganizerModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
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
