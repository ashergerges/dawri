// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsSummaryModel _$ContractsSummaryModelFromJson(
  Map<String, dynamic> json,
) => ContractsSummaryModel(
  active: (json['active'] as num?)?.toInt(),
  pending: (json['pending'] as num?)?.toInt(),
);

Map<String, dynamic> _$ContractsSummaryModelToJson(
  ContractsSummaryModel instance,
) => <String, dynamic>{'active': instance.active, 'pending': instance.pending};

ContractTeamModel _$ContractTeamModelFromJson(Map<String, dynamic> json) =>
    ContractTeamModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ContractTeamModelToJson(ContractTeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

ContractModel _$ContractModelFromJson(Map<String, dynamic> json) =>
    ContractModel(
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
          : SalaryTypeModel.fromJson(
              json['salaryType'] as Map<String, dynamic>,
            ),
      amount: json['amount'] as num?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      totalHours: (json['totalHours'] as num?)?.toInt(),
      rating: json['rating'] as num?,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$ContractModelToJson(ContractModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contractNumber': instance.contractNumber,
      'status': instance.status,
      'team': instance.team,
      'contractType': instance.contractType,
      'salaryType': instance.salaryType,
      'amount': instance.amount,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'totalHours': instance.totalHours,
      'rating': instance.rating,
      'notes': instance.notes,
      'created_at': instance.createdAt,
    };
