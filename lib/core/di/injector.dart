import 'package:get_it/get_it.dart';

import '../../features/admin/app_settings/presentation/manager/app_settings_bloc.dart';
import '../../features/admin/app_settings/presentation/manager/language_bloc.dart';
import '../../features/admin/category/presentation/manager/admin_category_bloc.dart';
import '../../features/user/app_drawer/presentation/manager/app_drawer_category_list_bloc.dart';
import '../../features/user/category/presentation/manager/category_bloc.dart';
import '../../features/user/home/presentation/manager/home_bloc.dart';
import '../data/data_sources/remote/app_settings_remote_data_source.dart';
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

  ///Remote Data Source ///
  injector.registerLazySingleton<CategoryRemoteDataSource>(() => CategoryRemoteDataSourceImpl(apiClient: injector<ApiClient>()));
  injector.registerLazySingleton<AppSettingsRemoteDataSource>(() => AppSettingsRemoteDataSourceImpl(apiClient: injector<ApiClient>()));
  injector.registerLazySingleton<LanguageRemoteDataSource>(() => LanguageRemoteDataSourceImpl(apiClient: injector<ApiClient>()));

  /// Repository ///
  injector.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(categoryRemoteDataSource: injector<CategoryRemoteDataSource>()));
  injector.registerLazySingleton<AppSettingsRepository>(() =>AppSettingsRepositoryImpl(appSettingsRemoteDataSource: injector<AppSettingsRemoteDataSource>()));
  injector.registerLazySingleton<LanguageRepository>(() =>LanguageRepositoryImpl(languageRemoteDataSource: injector<LanguageRemoteDataSource>()));

  /// BloC ///
  injector.registerLazySingleton(() => CategoryBloc(categoryRepository: injector<CategoryRepository>()));
  injector.registerLazySingleton(() => HomeBloc(categoryRepository: injector<CategoryRepository>()));
  // injector.registerLazySingleton(() => AppDrawerCategoryListBloc(categoryRepository: injector<CategoryRepository>()));
  injector.registerLazySingleton(() => AdminCategoryBloc(categoryRepository: injector<CategoryRepository>()));
  injector.registerLazySingleton(() => AppSettingsBloc(appSettingsRepository: injector<AppSettingsRepository>()));
  injector.registerLazySingleton(() => LanguageBloc(languageRepository: injector<LanguageRepository>()));
}
