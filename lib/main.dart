import 'package:flutter/material.dart';

import 'core/di/injector.dart';
import 'app.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_strategy/url_strategy.dart';

import 'features/admin/app_settings/presentation/manager/language_bloc.dart';
import 'features/user/category/presentation/manager/category_bloc.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  setPathUrlStrategy();
  await initDependencies();
  injector<LanguageBloc>().add(const LanguageInitEvent());
  injector<CategoryBloc>().add(const CategoryInitEvent());
  runApp(const App());
}
