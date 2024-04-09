import 'package:get_it/get_it.dart';

import '../../features/category/presentation/manager/category_bloc.dart';
import '../data/data_sources/remote/category_remote_data_source.dart';
import '../data/repository/category_repository_impl.dart';
import '../domain/repository/category_repository.dart';
import '../utils/request/request.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async {
  /// request
  injector.registerSingleton<ApiClient>(ApiClient());

  ///Remote Data Source ///
  injector.registerLazySingleton<CategoryRemoteDataSource>(() => CategoryRemoteDataSourceImpl(request: injector<ApiClient>()));

  /// Repository ///
  injector.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(categoryRemoteDataSource: injector<CategoryRemoteDataSource>()));

  /// BloC ///
  injector.registerLazySingleton(() => CategoryBloc(categoryRepository: injector<CategoryRepository>()));
}
