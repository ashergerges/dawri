// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractTypeModel _$ContractTypeModelFromJson(Map<String, dynamic> json) =>
    ContractTypeModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$ContractTypeModelToJson(ContractTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

SalaryTypeModel _$SalaryTypeModelFromJson(Map<String, dynamic> json) =>
    SalaryTypeModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      value: json['value'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$SalaryTypeModelToJson(SalaryTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'icon': instance.icon,
    };
