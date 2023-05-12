import 'package:dio/dio.dart';
import 'package:fake_store/core/data/repository/category_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/data/repository/products_repository_impl.dart';
import 'core/domain/repository/category_repository.dart';
import 'core/domain/repository/products_repository.dart';
import 'my_app.dart';

void main() {
  GetIt.I.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(dio: Dio()),
  );
  GetIt.I.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(dio: Dio()),
  );
  runApp(const MyApp());
}
