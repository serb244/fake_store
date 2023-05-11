import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/router/routes.dart';
import 'core/data/repository/products_repository_impl.dart';
import 'core/domain/repository/products_repository.dart';

void main() {
  GetIt.I.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(dio: Dio()),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig:
          _appRouter.config(navigatorObservers: () => [RouteObserver()]),
    );
  }
}
