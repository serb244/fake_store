import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/admin/category/presentation/pages/admin_category.dart';
import '../../features/admin/home/presentation/pages/admin_screen.dart';
import '../../features/category/presentation/pages/category_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/product_detail/presentation/pages/product_detail_screen.dart';
import 'go_router_observer.dart';
import 'route_constants.dart';
import 'screens/screens.dart';

class AppRouter {
  static final GoRouterObserver _routerObserver = GoRouterObserver();

  static GoRouter get router => _router;

  AppRouter();

  static final GoRouter _router = GoRouter(
    observers: [
      _routerObserver,
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    debugLogDiagnostics: true,
    initialLocation: RouteConstants.homePath,
    routes: <GoRoute>[
      GoRoute(
        path: RouteConstants.homePath,
        name: RouteConstants.homeName,
        builder: (context, state) => const HomeScreen(),
        routes: <GoRoute>[
          GoRoute(path: RouteConstants.categoryPath, name: RouteConstants.categoryName, builder: (context, state) => const CategoryScreen()),
          GoRoute(path: RouteConstants.productPath, name: RouteConstants.productName, builder: (context, state) => const ProductDetailScreen()),
        ],
      ),
      GoRoute(
        path: RouteConstants.adminPath,
        name: RouteConstants.adminName,
        builder: (context, state) => const AdminScreen(),
        routes: <GoRoute>[
          GoRoute(
              path: RouteConstants.adminCategoryPath,
              name: RouteConstants.adminCategoryName,
              builder: (context, state) => AdminCategory(
                categoryId:state.pathParameters['categoryId'] ?? "0",
                  )),
          // GoRoute(path: RouteConstants.productPath, name: RouteConstants.productName, builder: (context, state) => const ProductDetailScreen()),
        ],
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   bool loggedIn = injector<AuthBloc>().state is AuthSuccessState;
    //   bool isLoginPage = state.matchedLocation == RouteConstants.loginPath;
    //   if (!loggedIn && !isLoginPage) {
    //     return RouteConstants.loginPath;
    //   }
    //   if (loggedIn && isLoginPage) {
    //     injector<MatchListBloc>().user = injector<AuthBloc>().isUserGuest ? injector<AuthBloc>().guestUser : injector<AuthBloc>().user;
    //     injector<MatchListBloc>().add(const MatchListShowDataEvent(isFirstTime: true));
    //     return RouteConstants.homePath;
    //   } else {
    //     return null;
    //   }
    // },
    // refreshListenable: StreamListener(injector<AuthBloc>().stream),
  );
}

class StreamListener extends ChangeNotifier {
  /// Creates a [StreamListener].
  ///
  /// Every time the [Stream] receives an event this [ChangeNotifier] will
  /// notify its listeners.
  StreamListener(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
