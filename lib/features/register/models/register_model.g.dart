// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerPositionModel _$PlayerPositionModelFromJson(Map<String, dynamic> json) =>
    PlayerPositionModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$PlayerPositionModelToJson(
  PlayerPositionModel instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};

RefereeRoleModel _$RefereeRoleModelFromJson(Map<String, dynamic> json) =>
    RefereeRoleModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$RefereeRoleModelToJson(RefereeRoleModel instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

CoachSpecializationModel _$CoachSpecializationModelFromJson(
  Map<String, dynamic> json,
) => CoachSpecializationModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$CoachSpecializationModelToJson(
  CoachSpecializationModel instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};
