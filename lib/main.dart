import 'package:dio/dio.dart';
import 'package:fake_store/features/products/presentation/pages/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'features/products/data/repositories/products_repository_impl.dart';
import 'features/products/domain/repositories/products_repository.dart';

void main() {
  GetIt.I.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(dio: Dio()),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductsScreen(),
    );
  }
}
