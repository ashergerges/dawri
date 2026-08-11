// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    SearchResultModel(
      id: _readNum(json, 'id') as num?,
      resultType: _readNum(json, 'result_type') as num?,
      resultTypeLabel: _readText(json, 'result_type_label') as String?,
      name: _readText(json, 'name') as String?,
      image: _readText(json, 'image') as String?,
      city: _readText(json, 'city') as String?,
      role: _readText(json, 'role') as String?,
      rate: _readNum(json, 'rate') as num?,
      teamsCount: _readNum(json, 'teams_count') as num?,
    );
