part of 'app_settings_bloc.dart';

abstract class AppSettingsState extends Equatable {
  const AppSettingsState();
}

class AppSettingsInitialState extends AppSettingsState {
  @override
  List<Object> get props => [];
}

class AppSettingsLoadingState extends AppSettingsState {
  @override
  List<Object> get props => [];
}

class AppSettingsLoadedState extends AppSettingsState {
  final AppSettings appSettings;

   AppSettingsLoadedState({required this.appSettings}){
     print( "appSettings.toString() : ${appSettings.toString()}" );
   }
  @override
  List<Object> get props => [appSettings];

}

class AppSettingsErrorState extends AppSettingsState {
  final String message;

  const AppSettingsErrorState({required this.message});
  @override
  List<Object> get props => [message];

}
