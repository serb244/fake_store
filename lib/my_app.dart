import 'package:flutter/material.dart';

import 'core/utils/router/app_route_observer.dart';
import 'core/utils/router/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig:
          appRouter.config(navigatorObservers: () => [AppRouteObserver()]),
    );
  }
}
