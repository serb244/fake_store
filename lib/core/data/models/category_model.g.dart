// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      categoryId: json['categoryId'] as int,
      image: json['image'] as String?,
      parentCategoryId: json['parentCategoryId'] as int?,
      top: json['top'] as bool,
      column: json['column'] as int,
      sortOrder: json['sortOrder'] as int,
      status: json['status'] as bool,
      dateAdded: DateTime.parse(json['dateAdded'] as String),
      dateModified: DateTime.parse(json['dateModified'] as String),
      languageId: json['languageId'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      metaTitle: json['metaTitle'] as String?,
      metaDescription: json['metaDescription'] as String?,
      metaKeyword: json['metaKeyword'] as String?,
      seoKeyword: json['seoKeyword'] as String?,
      seoH1: json['seoH1'] as String?,
      seoH2: json['seoH2'] as String?,
      seoH3: json['seoH3'] as String?,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'image': instance.image,
      'parentCategoryId': instance.parentCategoryId,
      'top': instance.top,
      'column': instance.column,
      'sortOrder': instance.sortOrder,
      'status': instance.status,
      'dateAdded': instance.dateAdded.toIso8601String(),
      'dateModified': instance.dateModified.toIso8601String(),
      'languageId': instance.languageId,
      'name': instance.name,
      'description': instance.description,
      'metaTitle': instance.metaTitle,
      'metaDescription': instance.metaDescription,
      'metaKeyword': instance.metaKeyword,
      'seoKeyword': instance.seoKeyword,
      'seoH1': instance.seoH1,
      'seoH2': instance.seoH2,
      'seoH3': instance.seoH3,
    };
