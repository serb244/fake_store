import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/app_settings/app_settings.dart';
import '../../domain/repository/app_settings_repository.dart';
import '../../error/exceptions.dart';

part 'app_settings_event.dart';

part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettings appSettings = AppSettings.init();
  final AppSettingsRepository appSettingsRepository;

  AppSettingsBloc({required this.appSettingsRepository}) : super(AppSettingsInitialState()) {
    on<AppSettingsInitEvent>(_init);
    on<AppSettingsChangeEvent>(_change);
    add(const AppSettingsInitEvent());
  }
  _change (AppSettingsChangeEvent event, Emitter<AppSettingsState> emit) async {
    Either<BaseException, bool> appSettingsResponse = await appSettingsRepository.saveAppSettingsLocal(appSettings: event.appSettings);
    appSettingsResponse.fold((l) => emit(AppSettingsErrorState(message: l.userMessage.toString())), (r) {
      appSettings = event.appSettings;
      emit(AppSettingsLoadedState(appSettings: appSettings));

    });
  }
  _init(AppSettingsInitEvent event, Emitter<AppSettingsState> emit) async {
    Either<BaseException, AppSettings?> appSettingsResponse = await appSettingsRepository.getAppSettings(force: true);
    print("appSettings $appSettingsResponse");
    appSettingsResponse.fold((l) => emit(AppSettingsErrorState(message: l.userMessage.toString())), (AppSettings? r) {
      r is AppSettings ? appSettings = r : AppSettings.init();
      emit(AppSettingsLoadedState(appSettings: appSettings));
    });
  }
}
