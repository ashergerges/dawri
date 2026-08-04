// lib/features/contracts/data/models/contracts_model.dart
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:dawri/features/create_contract/data/models/create_contract_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contracts_model.g.dart';

/// Contract status ids used by `GET api/app/contracts?status=` and
/// `POST api/app/contracts/status`.
class ContractStatusId {
  ContractStatusId._();

  static const int pending = 1;
  static const int active = 2;
  static const int rejected = 3;
}

// ─── Summary — GET api/app/contracts/summary ───────────────────────────────────
@JsonSerializable()
class ContractsSummaryModel {
  final int? active;
  final int? pending;

  ContractsSummaryModel({this.active, this.pending});

  factory ContractsSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ContractsSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContractsSummaryModelToJson(this);
}

// ─── Team (second party) ──────────────────────────────────────────────────────
@JsonSerializable()
class ContractTeamModel {
  final int? id;
  final String? name;
  final String? image;

  ContractTeamModel({this.id, this.name, this.image});

  factory ContractTeamModel.fromJson(Map<String, dynamic> json) =>
      _$ContractTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContractTeamModelToJson(this);
}

// ─── Contract — GET api/app/contracts ─────────────────────────────────────────
@JsonSerializable()
class ContractModel {
  final int? id;
  final String? contractNumber;
  final int? status;
  final ContractTeamModel? team;

  /// Reused from `create_contract` (both carry the optional `icon` name).
  final ContractTypeModel? contractType;
  final SalaryTypeModel? salaryType;

  final num? amount;
  final String? startDate;
  final String? endDate;
  final int? totalHours;
  final num? rating;
  final String? notes;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  ContractModel({
    this.id,
    this.contractNumber,
    this.status,
    this.team,
    this.contractType,
    this.salaryType,
    this.amount,
    this.startDate,
    this.endDate,
    this.totalHours,
    this.rating,
    this.notes,
    this.createdAt,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) =>
      _$ContractModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContractModelToJson(this);
}

// ─── Pagination ───────────────────────────────────────────────────────────────
/// Shared tolerant pagination parser (`core/utils/helper/api_pagination.dart`).
typedef ContractsPaginationModel = ApiPagination;

/// One page of contracts: the `items` list plus its `pagination` block.
class ContractsPageModel {
  final List<ContractModel> items;
  final ContractsPaginationModel? pagination;

  const ContractsPageModel({required this.items, this.pagination});
}

// ─── UI value object used by the details grid on each card ─────────────────────
class ContractDetailItem {
  final String labelKey;
  final String value;
  final IconData? icon;
  final Color? valueColor;

  const ContractDetailItem({
    required this.labelKey,
    required this.value,
    this.icon,
    this.valueColor,
  });
}
