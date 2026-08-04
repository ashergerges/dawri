// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractUserModel _$ContractUserModelFromJson(Map<String, dynamic> json) =>
    ContractUserModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$ContractUserModelToJson(ContractUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

ContractDetailsPositionModel _$ContractDetailsPositionModelFromJson(
  Map<String, dynamic> json,
) => ContractDetailsPositionModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$ContractDetailsPositionModelToJson(
  ContractDetailsPositionModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

ContractDetailsModel _$ContractDetailsModelFromJson(
  Map<String, dynamic> json,
) => ContractDetailsModel(
  id: (json['id'] as num?)?.toInt(),
  contractNumber: json['contractNumber'] as String?,
  status: (json['status'] as num?)?.toInt(),
  team: json['team'] == null
      ? null
      : ContractTeamModel.fromJson(json['team'] as Map<String, dynamic>),
  contractType: json['contractType'] == null
      ? null
      : ContractTypeModel.fromJson(
          json['contractType'] as Map<String, dynamic>,
        ),
  salaryType: json['salaryType'] == null
      ? null
      : SalaryTypeModel.fromJson(json['salaryType'] as Map<String, dynamic>),
  user: json['user'] == null
      ? null
      : ContractUserModel.fromJson(json['user'] as Map<String, dynamic>),
  position: json['position'] == null
      ? null
      : ContractDetailsPositionModel.fromJson(
          json['position'] as Map<String, dynamic>,
        ),
  amount: json['amount'] as num?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  totalHours: (json['totalHours'] as num?)?.toInt(),
  rating: json['rating'] as num?,
  terms: json['terms'] as String?,
  acceptedAt: json['accepted_at'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$ContractDetailsModelToJson(
  ContractDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'contractNumber': instance.contractNumber,
  'status': instance.status,
  'team': instance.team,
  'contractType': instance.contractType,
  'salaryType': instance.salaryType,
  'user': instance.user,
  'position': instance.position,
  'amount': instance.amount,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'totalHours': instance.totalHours,
  'rating': instance.rating,
  'terms': instance.terms,
  'accepted_at': instance.acceptedAt,
  'created_at': instance.createdAt,
};
