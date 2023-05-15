import 'package:flutter/material.dart';

import 'core/utils/router/app_route_observer.dart';
import 'core/utils/router/app_router.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig:
          _appRouter.config(navigatorObservers: () => [AppRouteObserver()]),
    );
  }
}
