// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqCategoryModel _$FaqCategoryModelFromJson(Map<String, dynamic> json) =>
    FaqCategoryModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      slug: json['slug'] as String?,
      faqsCount: (json['faqs_count'] as num?)?.toInt(),
    );

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => FaqModel(
  id: (json['id'] as num?)?.toInt(),
  question: json['question'] as String?,
  answer: json['answer'] as String?,
  categoryId: (json['category_id'] as num?)?.toInt(),
);
