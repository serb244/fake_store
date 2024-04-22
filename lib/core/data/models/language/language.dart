import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';
@freezed
class Language with _$Language {
  const factory Language({
    required int languageId,
    required String name,
    required String code,
    required String locale,
    required String image,
    required String directory,
    required int sortOrder,
    required bool status,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}
