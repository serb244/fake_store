import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/product/presentation/pages/product_screen.dart';
import '../../features/products/data/remote/models/products_model.dart';
import '../../features/products/presentation/pages/products_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProductRoute.page),
        AutoRoute(page: ProductsRoute.page, path: '/'),
      ];
}
