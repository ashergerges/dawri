// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantTypeModel _$ParticipantTypeModelFromJson(
  Map<String, dynamic> json,
) => ParticipantTypeModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$ParticipantTypeModelToJson(
  ParticipantTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'icon': instance.icon,
};
