import 'package:freezed_annotation/freezed_annotation.dart';

import '../language/language.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';
@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    /// languageId храним в шареде,
    /// 0 пока нет языка из бекенда, при первом запуске = id языка из бекенда
    /// 0 - єто текста с базовіми возможніми ошибками на случай проблем с бекендом
    required int languageId,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
  factory AppSettings.init() => const AppSettings(languageId: 1);
}
