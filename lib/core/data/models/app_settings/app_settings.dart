import 'package:freezed_annotation/freezed_annotation.dart';

import '../language/language.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';
@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required List<Language> languages,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
  factory AppSettings.init() => AppSettings(languages: [Language.init()]);
}
