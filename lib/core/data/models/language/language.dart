import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';
@freezed
class Language with _$Language {
  const factory Language({
    required int id,
    required String name,
    required String code,
    String? locale,
     String? image,
     String? directory,
     int? sortOrder,
     bool? status,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);

  factory Language.init() => const Language (
    id:1,
    name: 'ukrainian',
    code: 'uk',
  );
}
