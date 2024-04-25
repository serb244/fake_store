
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/data/models/app_settings/app_settings.dart';
import '../../../../../core/domain/repository/app_settings_repository.dart';
import '../../../../../core/error/exceptions.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final AppSettingsRepository appSettingsRepository;
  AppSettingsBloc({required this.appSettingsRepository}) : super(AppSettingsInitialState()) {
    on<AppSettingsInitEvent>(_init);
    add(const AppSettingsInitEvent());
  }
  _init(AppSettingsInitEvent event, Emitter<AppSettingsState> emit) async {
      Either<BaseException, AppSettings> appSettings = await appSettingsRepository.getAppSettings(appSettings: AppSettings.init(), force: true);
      print("appSettings $appSettings");
      appSettings.fold((l) => emit(AppSettingsErrorState(message: l.userMessage.toString())), (r) => emit(AppSettingsLoadedState(appSettings: r)));
  }
}
