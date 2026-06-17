// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    SettingsModel(
      phone: json['phone'] as String?,
      whatsappLink: json['whatsapp_link'] as String?,
      twitterLink: json['twitter_link'] as String?,
      instagramLink: json['instagram_link'] as String?,
      snapchatLink: json['snapchat_link'] as String?,
      tiktokLink: json['tiktok_link'] as String?,
    );

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'whatsapp_link': instance.whatsappLink,
      'twitter_link': instance.twitterLink,
      'instagram_link': instance.instagramLink,
      'snapchat_link': instance.snapchatLink,
      'tiktok_link': instance.tiktokLink,
    };
