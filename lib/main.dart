import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app.dart';
import 'bloc_observer.dart';
import 'core/di/injector.dart';
import 'core/utils/app_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  setPathUrlStrategy();
  await initDependencies();
  Bloc.observer = MyBlocObserver();
  appInit();
  runApp(const App());
}
