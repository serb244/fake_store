import 'package:freezed_annotation/freezed_annotation.dart';

import '../language/language.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';
@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required Language language,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
}
