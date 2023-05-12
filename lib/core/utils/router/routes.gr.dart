// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    Route404.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Screen404(),
      );
    },
    CategoryListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryListScreen(),
      );
    },
    ProductsListRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsListRouteArgs>(
          orElse: () => const ProductsListRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductsListScreen(
          categoryName: args.categoryName,
          key: args.key,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailRouteArgs>(
          orElse: () => ProductDetailRouteArgs(url: pathParams.getInt('url')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailScreen(
          url: args.url,
          key: args.key,
        ),
      );
    },
    DashBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashBoardScreen(),
      );
    },
  };
}

/// generated route for
/// [Screen404]
class Route404 extends PageRouteInfo<void> {
  const Route404({List<PageRouteInfo>? children})
      : super(
          Route404.name,
          initialChildren: children,
        );

  static const String name = 'Route404';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryListScreen]
class CategoryListRoute extends PageRouteInfo<void> {
  const CategoryListRoute({List<PageRouteInfo>? children})
      : super(
          CategoryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductsListScreen]
class ProductsListRoute extends PageRouteInfo<ProductsListRouteArgs> {
  ProductsListRoute({
    String? categoryName,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProductsListRoute.name,
          args: ProductsListRouteArgs(
            categoryName: categoryName,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductsListRoute';

  static const PageInfo<ProductsListRouteArgs> page =
      PageInfo<ProductsListRouteArgs>(name);
}

class ProductsListRouteArgs {
  const ProductsListRouteArgs({
    this.categoryName,
    this.key,
  });

  final String? categoryName;

  final Key? key;

  @override
  String toString() {
    return 'ProductsListRouteArgs{categoryName: $categoryName, key: $key}';
  }
}

/// generated route for
/// [ProductDetailScreen]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    required int url,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            url: url,
            key: key,
          ),
          rawPathParams: {'url': url},
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    required this.url,
    this.key,
  });

  final int url;

  final Key? key;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{url: $url, key: $key}';
  }
}

/// generated route for
/// [DashBoardScreen]
class DashBoardRoute extends PageRouteInfo<void> {
  const DashBoardRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
