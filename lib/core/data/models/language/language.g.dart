// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageImpl _$$LanguageImplFromJson(Map<String, dynamic> json) =>
    _$LanguageImpl(
      languageId: json['languageId'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      locale: json['locale'] as String,
      image: json['image'] as String,
      directory: json['directory'] as String,
      sortOrder: json['sortOrder'] as int,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$$LanguageImplToJson(_$LanguageImpl instance) =>
    <String, dynamic>{
      'languageId': instance.languageId,
      'name': instance.name,
      'code': instance.code,
      'locale': instance.locale,
      'image': instance.image,
      'directory': instance.directory,
      'sortOrder': instance.sortOrder,
      'status': instance.status,
    };
