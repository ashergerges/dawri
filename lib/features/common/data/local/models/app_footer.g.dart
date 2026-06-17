// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_footer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppFooterModel _$AppFooterModelFromJson(Map<String, dynamic> json) =>
    AppFooterModel(
      social:
          (json['social'] as List<dynamic>?)
              ?.map((e) => Social.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      licenses: json['licenses'] == null
          ? null
          : Licenses.fromJson(json['licenses'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppFooterModelToJson(AppFooterModel instance) =>
    <String, dynamic>{'social': instance.social, 'licenses': instance.licenses};

Licenses _$LicensesFromJson(Map<String, dynamic> json) => Licenses(
  title: json['title'] as String? ?? '',
  linkLabel: json['linkLabel'] as String? ?? '',
  urlLink: json['urlLink'] as String? ?? '',
);

Map<String, dynamic> _$LicensesToJson(Licenses instance) => <String, dynamic>{
  'title': instance.title,
  'linkLabel': instance.linkLabel,
  'urlLink': instance.urlLink,
};

Social _$SocialFromJson(Map<String, dynamic> json) =>
    Social(iconUrl: json['icon'] as String?, url: json['url'] as String? ?? '');

Map<String, dynamic> _$SocialToJson(Social instance) => <String, dynamic>{
  'icon': instance.iconUrl,
  'url': instance.url,
};
