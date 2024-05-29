// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as int,
      image: json['image'] as String?,
      parentCategoryId: json['parent'] as int?,
      top: json['top'] as bool,
      column: json['column'] as int,
      sortOrder: json['sort_order'] as int,
      status: json['status'] as bool,
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      dateModified: json['date_modified'] == null
          ? null
          : DateTime.parse(json['date_modified'] as String),
      description: (json['description'] as List<dynamic>)
          .map((e) => CategoryDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'parent': instance.parentCategoryId,
      'top': instance.top,
      'column': instance.column,
      'sort_order': instance.sortOrder,
      'status': instance.status,
      'date_added': instance.dateAdded?.toIso8601String(),
      'date_modified': instance.dateModified?.toIso8601String(),
      'description': instance.description,
    };
