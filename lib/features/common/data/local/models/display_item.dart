import 'package:flutter/material.dart';

class DisplayItem {
  String? id;
  String? name;
  bool? isSelected;
  Widget? icon;
  Function()? onTap;

  DisplayItem({this.id, this.isSelected=false, this.name, this.icon});

  DisplayItem copyWith(
          {String? id, bool? isSelected, String? name, Widget? icon}) =>
      DisplayItem(
        id: id ?? this.id,
        isSelected: isSelected ?? this.isSelected,
        name: name ?? this.name,
        icon: icon ?? this.icon,
      );
  factory DisplayItem.fromJson(Map<String, dynamic> json) {
    return DisplayItem(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
