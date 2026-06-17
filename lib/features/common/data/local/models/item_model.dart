// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'item_model.g.dart';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

@JsonSerializable()
class ItemModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "isSelected")
  bool? isSelected;

  ItemModel({
    this.id,
    this.title,
    this.isSelected,
  });

  ItemModel copyWith({
    String? id,
    String? title,
    bool? isSelected,
  }) =>
      ItemModel(
        id: id ?? this.id,
        title: title ?? this.title,
        isSelected: isSelected ?? this.isSelected,
      );

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
