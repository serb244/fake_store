import 'package:get_it/get_it.dart';

import '../blocs/app_settings/app_settings_bloc.dart';
import '../blocs/language/language_bloc.dart';
import '../../features/user/home/presentation/manager/home_bloc.dart';
import '../blocs/category/category_bloc.dart';
import '../data/data_sources/local/app_settings_local_data_source.dart';
import '../data/data_sources/remote/category_remote_data_source.dart';
import '../data/data_sources/remote/language_remote_data_source.dart';
import '../data/repository/app_settings_repository_impl.dart';
import '../data/repository/category_repository_impl.dart';
import '../data/repository/language_repository_impl.dart';
import '../domain/repository/app_settings_repository.dart';
import '../domain/repository/category_repository.dart';
import '../domain/repository/language_repository.dart';
import '../utils/request/request.dart';

final injector = GetIt.instance;
bool isAdmin = true;
Future<void> initDependencies() async {
  /// request ///
  injector.registerSingleton<ApiClient>(ApiClient());

  ///Local Data Source ///
  injector.registerLazySingleton<AppSettingsLocalDataSource>(() => AppSettingsLocalDataSourceImpl());

  ///Remote Data Source ///
  injector.registerLazySingleton<CategoryRemoteDataSource>(() => CategoryRemoteDataSourceImpl(apiClient: injector<ApiClient>()));
  // injector.registerLazySingleton<AppSettingsRemoteDataSource>(() => AppSettingsRemoteDataSourceImpl(apiClient: injector<ApiClient>()));
  injector.registerLazySingleton<LanguageRemoteDataSource>(() => LanguageRemoteDataSourceImpl(apiClient: injector<ApiClient>()));

  /// Repository ///
  injector.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(categoryRemoteDataSource: injector<CategoryRemoteDataSource>()));
  injector.registerLazySingleton<AppSettingsRepository>(() =>AppSettingsRepositoryImpl(appSettingsLocalDataSource: injector<AppSettingsLocalDataSource>()));
  injector.registerLazySingleton<LanguageRepository>(() =>LanguageRepositoryImpl(languageRemoteDataSource: injector<LanguageRemoteDataSource>()));

  /// BloC ///
  injector.registerLazySingleton(() => CategoryBloc(categoryRepository: injector<CategoryRepository>()));
  injector.registerLazySingleton(() => HomeBloc(categoryRepository: injector<CategoryRepository>()));
  injector.registerLazySingleton(() => AppSettingsBloc(appSettingsRepository: injector<AppSettingsRepository>(), languageRepository: injector<LanguageRepository>()));
  injector.registerLazySingleton(() => LanguageBloc(languageRepository: injector<LanguageRepository>()));
}
