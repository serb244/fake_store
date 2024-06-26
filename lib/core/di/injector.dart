import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/data_source/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/manager/auth_bloc.dart';
import '../blocs/app_settings/app_settings_bloc.dart';
import '../blocs/language/language_bloc.dart';
import '../../features/user/home/presentation/manager/home_bloc.dart';
import '../blocs/category/category_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../data/data_sources/local/app_settings_local_data_source.dart';
import '../data/data_sources/local/user_local_data_source.dart';
import '../data/data_sources/remote/category_remote_data_source.dart';
import '../data/data_sources/remote/language_remote_data_source.dart';
import '../data/repository/app_settings_repository_impl.dart';
import '../data/repository/category_repository_impl.dart';
import '../data/repository/language_repository_impl.dart';
import '../data/repository/user_repository_impl.dart';
import '../domain/repository/app_settings_repository.dart';
import '../domain/repository/category_repository.dart';
import '../domain/repository/language_repository.dart';
import '../domain/repository/user_repository.dart';
import '../utils/request/request.dart';

final injector = GetIt.instance;
bool isAdmin = true;
Future<void> initDependencies() async {
  /// request ///
  injector.registerSingleton<ApiClient>(ApiClient());
  injector.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  ///Local Data Source ///
  injector.registerLazySingleton<AppSettingsLocalDataSource>(() => AppSettingsLocalDataSourceImpl());
  injector.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(flutterSecureStorage:  injector<FlutterSecureStorage>()));

  ///Remote Data Source ///
  injector.registerLazySingleton<CategoryRemoteDataSource>(() => CategoryRemoteDataSourceImpl(apiClient: injector<ApiClient>()));
  // injector.registerLazySingleton<AppSettingsRemoteDataSource>(() => AppSettingsRemoteDataSourceImpl(apiClient: injector<ApiClient>()));
  injector.registerLazySingleton<LanguageRemoteDataSource>(() => LanguageRemoteDataSourceImpl(apiClient: injector<ApiClient>()));
  injector.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(apiClient: injector<ApiClient>()));

  /// Repository ///
  injector.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(categoryRemoteDataSource: injector<CategoryRemoteDataSource>()));
  injector.registerLazySingleton<AppSettingsRepository>(() =>AppSettingsRepositoryImpl(appSettingsLocalDataSource: injector<AppSettingsLocalDataSource>()));
  injector.registerLazySingleton<LanguageRepository>(() =>LanguageRepositoryImpl(languageRemoteDataSource: injector<LanguageRemoteDataSource>()));
  injector.registerLazySingleton<AuthRepository>(() =>AuthRepositoryImpl(authRemoteDataSource: injector<AuthRemoteDataSource>()));
  injector.registerLazySingleton<UserRepository>(() =>UserRepositoryImpl(userLocalDataSource: injector<UserLocalDataSource>()));

  /// BloC ///
  injector.registerLazySingleton(() => CategoryBloc(categoryRepository: injector<CategoryRepository>()));
  injector.registerLazySingleton(() => HomeBloc(categoryRepository: injector<CategoryRepository>()));
  injector.registerLazySingleton(() => AppSettingsBloc(appSettingsRepository: injector<AppSettingsRepository>(), languageRepository: injector<LanguageRepository>()));
  injector.registerLazySingleton(() => LanguageBloc(languageRepository: injector<LanguageRepository>()));
  injector.registerLazySingleton(() => AuthBloc(authRepository: injector<AuthRepository>(), userRepository: injector<UserRepository>()));
  injector.registerLazySingleton(() => UserBloc(userRepository: injector<UserRepository>()));
}
