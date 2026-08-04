// lib/features/contract_details/data/models/contract_details_model.dart
import 'package:dawri/features/contracts/data/models/contracts_model.dart';
import 'package:dawri/features/create_contract/data/models/create_contract_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contract_details_model.g.dart';

/// UI-facing status of the contract (derived from the API's int `status`).
enum ContractStatus { pending, signed, rejected }

/// Maps the API ids (see [ContractStatusId]) onto [ContractStatus].
ContractStatus contractStatusFromId(int? id) {
  switch (id) {
    case ContractStatusId.active:
      return ContractStatus.signed;
    case ContractStatusId.rejected:
      return ContractStatus.rejected;
    default:
      return ContractStatus.pending;
  }
}

// ─── Player (second party) ────────────────────────────────────────────────────
@JsonSerializable()
class ContractUserModel {
  final int? id;
  final String? name;
  final String? avatar;

  ContractUserModel({this.id, this.name, this.avatar});

  factory ContractUserModel.fromJson(Map<String, dynamic> json) =>
      _$ContractUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContractUserModelToJson(this);
}

// ─── Position agreed on this contract ─────────────────────────────────────────
/// Deliberately separate from the participant position in `partner_details` —
/// this is the position fixed at contract-creation time.
@JsonSerializable()
class ContractDetailsPositionModel {
  final int? id;
  final String? name;

  ContractDetailsPositionModel({this.id, this.name});

  factory ContractDetailsPositionModel.fromJson(Map<String, dynamic> json) =>
      _$ContractDetailsPositionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContractDetailsPositionModelToJson(this);
}

// ─── Contract details — GET api/app/contracts/details ─────────────────────────
@JsonSerializable()
class ContractDetailsModel {
  final int? id;
  final String? contractNumber;
  final int? status;

  /// Reused from the contracts list / create-contract features.
  final ContractTeamModel? team;
  final ContractTypeModel? contractType;
  final SalaryTypeModel? salaryType;

  final ContractUserModel? user;
  final ContractDetailsPositionModel? position;

  final num? amount;
  final String? startDate;
  final String? endDate;
  final int? totalHours;
  final num? rating;
  final String? terms;

  /// When the player accepted — `null` while the contract is still pending.
  @JsonKey(name: 'accepted_at')
  final String? acceptedAt;

  /// When the team created / signed the contract (always present).
  @JsonKey(name: 'created_at')
  final String? createdAt;

  ContractDetailsModel({
    this.id,
    this.contractNumber,
    this.status,
    this.team,
    this.contractType,
    this.salaryType,
    this.user,
    this.position,
    this.amount,
    this.startDate,
    this.endDate,
    this.totalHours,
    this.rating,
    this.terms,
    this.acceptedAt,
    this.createdAt,
  });

  ContractStatus get statusEnum => contractStatusFromId(status);

  bool get isPending => status == ContractStatusId.pending;

  /// Terms arrive as one free-text blob — split on line breaks for the list.
  List<String> get termsLines => (terms ?? '')
      .split(RegExp(r'[\r\n]+'))
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  factory ContractDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ContractDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContractDetailsModelToJson(this);
}

// ─── UI value object for the details grid ─────────────────────────────────────
class DetailBoxData {
  final IconData icon;
  final Color iconColor;
  final String labelKey;
  final String value;
  final bool isHighlighted;
  final bool isFullWidth;

  const DetailBoxData({
    required this.icon,
    required this.iconColor,
    required this.labelKey,
    required this.value,
    this.isHighlighted = false,
    this.isFullWidth = false,
  });
}
