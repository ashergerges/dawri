// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: (json['id'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      typeText: json['type_text'] as String?,
      status: json['status'] as String?,
      amount: json['amount'] as String?,
      currency: json['currency'] as String?,
      paymentMethod: json['payment_method'] as String?,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      transactionable: json['transactionable'],
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'type_text': instance.typeText,
      'status': instance.status,
      'amount': instance.amount,
      'currency': instance.currency,
      'payment_method': instance.paymentMethod,
      'description': instance.description,
      'metadata': instance.metadata,
      'transactionable': instance.transactionable,
      'created_at': instance.createdAt,
    };

TransactionsPaginationModel _$TransactionsPaginationModelFromJson(
  Map<String, dynamic> json,
) => TransactionsPaginationModel(
  currentPage: (json['current_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$TransactionsPaginationModelToJson(
  TransactionsPaginationModel instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
  'total': instance.total,
  'last_page': instance.lastPage,
};
