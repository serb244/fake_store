part of 'app_settings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();
}
class AppSettingsInitEvent extends AppSettingsEvent {
  const AppSettingsInitEvent();

  @override
  List<Object?> get props => [];
}
class AppSettingsChangeEvent extends AppSettingsEvent {
  final AppSettings appSettings;
  const AppSettingsChangeEvent({ required this.appSettings });

  @override
  List<Object?> get props => [appSettings];
}
