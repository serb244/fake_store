// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryDescriptionImpl _$$CategoryDescriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryDescriptionImpl(
      categoryDescriptionId: json['id'] as int,
      categoryId: json['category'] as int,
      languageId: json['language'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      metaTitle: json['meta_title'] as String,
      metaDescription: json['meta_description'] as String,
      metaKeyword: json['meta_keyword'] as String,
      seoKeyword: json['seo_keyword'] as String,
      seoH1: json['seo_h1'] as String,
      seoH2: json['seo_h2'] as String,
      seoH3: json['seo_h3'] as String,
    );

Map<String, dynamic> _$$CategoryDescriptionImplToJson(
        _$CategoryDescriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.categoryDescriptionId,
      'category': instance.categoryId,
      'language': instance.languageId,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'meta_title': instance.metaTitle,
      'meta_description': instance.metaDescription,
      'meta_keyword': instance.metaKeyword,
      'seo_keyword': instance.seoKeyword,
      'seo_h1': instance.seoH1,
      'seo_h2': instance.seoH2,
      'seo_h3': instance.seoH3,
    };
