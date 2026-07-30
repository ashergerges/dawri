// lib/features/create_challenge/data/models/create_challenge_model.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';

// Sport type (id and display)
class SportTypeItem {
  final int id;
  final String name;
  final IconData icon;
  final Color color;
  const SportTypeItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

// Level (id and display)
class LevelItem {
  final int id;
  final String name;
  const LevelItem({required this.id, required this.name});
}

// Location (id and name)
class LocationItem {
  final int id;
  final String name;
  const LocationItem({required this.id, required this.name});
}

// Stadium (id and name)
class StadiumItem {
  final int id;
  final String name;
  const StadiumItem({required this.id, required this.name});
}

// Mock data
const List<SportTypeItem> mockSports = [
  SportTypeItem(id: 1, name: 'كرة قدم', icon: FontAwesomeIcons.futbol, color: AppColors.primaryLight),
  SportTypeItem(id: 2, name: 'إلكترونية', icon: FontAwesomeIcons.gamepad, color: AppColors.purple),
  SportTypeItem(id: 3, name: 'بادل', icon: FontAwesomeIcons.tableTennisPaddleBall, color: AppColors.warning),
];

const List<LevelItem> mockLevels = [
  LevelItem(id: 1, name: 'مبتدئ'),
  LevelItem(id: 2, name: 'متوسط'),
  LevelItem(id: 3, name: 'احترافي'),
  LevelItem(id: 4, name: 'مفتوح للكل'),
];

const List<LocationItem> mockLocations = [
  LocationItem(id: 1, name: 'الرياض'),
  LocationItem(id: 2, name: 'جدة'),
  LocationItem(id: 3, name: 'الدمام'),
  LocationItem(id: 4, name: 'مكة'),
  LocationItem(id: 5, name: 'المدينة'),
  LocationItem(id: 6, name: 'أخرى'),
];

const List<StadiumItem> mockStadiums = [
  StadiumItem(id: 1, name: 'ملعب الجامعة'),
  StadiumItem(id: 2, name: 'استاد الملك فهد'),
  StadiumItem(id: 3, name: 'ملعب الهلال'),
  StadiumItem(id: 4, name: 'صالة الألعاب الرياضية'),
  StadiumItem(id: 5, name: 'ملعب النادي الأهلي'),
];