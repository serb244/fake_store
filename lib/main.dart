import 'package:flutter/material.dart';

import 'core/di/injector.dart';
import 'app.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_strategy/url_strategy.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  setPathUrlStrategy();
  await initDependencies();
  runApp(const App());
}
