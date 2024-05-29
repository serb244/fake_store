import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/app_settings/app_settings.dart';
import '../../data/models/language/language.dart';
import '../../domain/repository/app_settings_repository.dart';
import '../../domain/repository/language_repository.dart';
import '../../error/exceptions.dart';

part 'app_settings_event.dart';

part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettings appSettings = AppSettings.init();
  final LanguageRepository languageRepository;
  final AppSettingsRepository appSettingsRepository;

  AppSettingsBloc({required this.appSettingsRepository, required this.languageRepository}) : super(AppSettingsInitialState()) {
    on<AppSettingsInitEvent>(_init);
    on<AppSettingsChangeEvent>(_change);
    add(const AppSettingsInitEvent());
    languageRepository.languageStream.listen((Either<BaseException, List<Language>> eitherCategoriesOrException) {
      eitherCategoriesOrException.fold(
        (exception) {
          print("AppSettingsBloc exception languageRepository languageStream ${exception.userMessage}");
          // add(LanguageErrorEvent(message: exception.userMessage.toString()));
        },
        (List<Language> res) {
          //     TODO make better!
          //     если текущий appSettings Language не в списке, то вибираем первый из списка
          print("res ${res.length}");
          if (res.isNotEmpty) {
            if (!res.any((element) => element.id == appSettings.languageId)) {
              appSettings = appSettings.copyWith(languageId: res.first.id);
              add(AppSettingsChangeEvent(appSettings: appSettings));
            }
          }
        },
      );
    });
  }

  _change(AppSettingsChangeEvent event, Emitter<AppSettingsState> emit) async {
    Either<BaseException, bool> appSettingsResponse = await appSettingsRepository.saveAppSettingsLocal(appSettings: event.appSettings);
    appSettingsResponse.fold((l) => emit(AppSettingsErrorState(message: l.userMessage.toString())), (r) {
      appSettings = event.appSettings;
      emit(AppSettingsLoadedState(appSettings: appSettings));
    });
  }

  _init(AppSettingsInitEvent event, Emitter<AppSettingsState> emit) async {
    Either<BaseException, AppSettings?> appSettingsResponse = await appSettingsRepository.getAppSettings(force: true);
    print("AppSettingsInitEvent appSettings $appSettingsResponse");
    appSettingsResponse.fold((l) => emit(AppSettingsErrorState(message: l.userMessage.toString())), (AppSettings? r) {
      r is AppSettings ? appSettings = r : AppSettings.init();
      emit(AppSettingsLoadedState(appSettings: appSettings));
    });
  }
}
