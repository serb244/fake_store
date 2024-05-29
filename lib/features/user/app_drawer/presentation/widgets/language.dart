import 'package:fake_store/core/data/models/language/language.dart';
import 'package:fake_store/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/blocs/app_settings/app_settings_bloc.dart';
import '../../../../../core/blocs/language/language_bloc.dart';
import '../../../../../core/data/models/app_settings/app_settings.dart';

class DrawerLanguageWidget extends StatelessWidget {
  const DrawerLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageBloc, LanguageState>(
      listener: (context, state) {
        if (state is LanguageErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
          // injector<CategoryBloc>().add(const CategoryInitEvent());
          // injector<CategoryBloc>().add(CategoryGetByIdEvent(categoryId: widget.id));
        }
      },
      builder: (context, state) {
        if (state is LanguageLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LanguageLoadedState) {
          final List<DropdownMenuItem<int>> items = state.languageList.map((Language value) {
            return DropdownMenuItem<int>(
              value: value.id,
              child: Text(value.name),
            );
          }).toList();
          return Row(
            children: [
              const Text("Language"),
              DropdownButton<int>(
                value:context.watch<AppSettingsBloc>().appSettings.languageId  ,
                // value:4  ,
                items: items,
                onChanged: (a) {
                  AppSettings newAppSettings = injector<AppSettingsBloc>().appSettings.copyWith(languageId: a!);
                  injector<AppSettingsBloc>().add(AppSettingsChangeEvent(appSettings: newAppSettings));
                },
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
