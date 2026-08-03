// lib/features/create_contract/data/models/create_contract_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'create_contract_model.g.dart';

// ─── Contract type — GET api/app/contract-types ───────────────────────────────
@JsonSerializable()
class ContractTypeModel {
  final int? id;
  final String? name;

  /// Kebab-case FontAwesome name (e.g. `fa-coins`); may be null.
  /// Resolve with `icon.toFaIcon()` from `core/utils/helper/fa_icon_mapper.dart`.
  final String? icon;

  ContractTypeModel({this.id, this.name, this.icon});

  factory ContractTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ContractTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContractTypeModelToJson(this);
}

// ─── Salary type — GET api/app/salary-types ───────────────────────────────────
/// [value] is the backend slug (`once` / `monthly` / `match`).
@JsonSerializable()
class SalaryTypeModel {
  final int? id;
  final String? name;
  final String? value;

  /// Kebab-case FontAwesome name (e.g. `fa-coins`); may be null.
  final String? icon;

  SalaryTypeModel({this.id, this.name, this.value, this.icon});

  factory SalaryTypeModel.fromJson(Map<String, dynamic> json) =>
      _$SalaryTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$SalaryTypeModelToJson(this);
}
