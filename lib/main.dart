import 'package:fake_store/core/blocs/app_settings/app_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'core/blocs/category/category_bloc.dart';
import 'core/di/injector.dart';
import 'app.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/blocs/language/language_bloc.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  setPathUrlStrategy();
  await initDependencies();
  Bloc.observer = MyBlocObserver();
  injector<AppSettingsBloc>().add(const AppSettingsInitEvent());
  ///LanguageInitEvent - get all languages from server, add to stream, set selected by user language
  injector<LanguageBloc>().add(const LanguageInitEvent( force: true));
  /// CategoryInitEvent - get all categories from server, add to stream
  injector<CategoryBloc>().add(const CategoryInitEvent(force: true));
  runApp(const App());
}
