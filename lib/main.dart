import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'core/blocs/category/category_bloc.dart';
import 'core/di/injector.dart';
import 'app.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_strategy/url_strategy.dart';

import 'features/admin/app_settings/presentation/manager/language_bloc.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  setPathUrlStrategy();
  await initDependencies();
  Bloc.observer = MyBlocObserver();
  injector<LanguageBloc>().add(const LanguageInitEvent());
  injector<CategoryBloc>().add(const CategoryInitEvent(force: true));
  runApp(const App());
}
