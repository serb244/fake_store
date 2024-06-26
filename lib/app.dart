import 'package:fake_store/core/di/di.dart';
import 'package:fake_store/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/blocs/category/category_bloc.dart';
import 'core/blocs/app_settings/app_settings_bloc.dart';
import 'core/blocs/language/language_bloc.dart';
import 'features/auth/presentation/manager/auth_bloc.dart';
import 'features/user/home/presentation/manager/home_bloc.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => injector<AppDrawerCategoryListBloc>()),
        // BlocProvider(create: (context) => injector<AdminCategoryBloc>()),
        BlocProvider(create: (context) => injector<CategoryBloc>()),
        BlocProvider(create: (context) => injector<HomeBloc>()),
        BlocProvider(create: (context) => injector<AppSettingsBloc>()),
        BlocProvider(create: (context) => injector<LanguageBloc>()),
        BlocProvider(create: (context) => injector<AuthBloc>()),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
