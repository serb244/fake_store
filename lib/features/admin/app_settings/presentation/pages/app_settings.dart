import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/app_settings_bloc.dart';
import 'admin_language_list.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppSettingsBloc, AppSettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("AppSettings"),
              actions: const [],
            ),
            body: SingleChildScrollView(child: _buildBody(context, state)));
      },
    );
  }

  Widget _buildBody(BuildContext context, AppSettingsState state) {
    if (state is AppSettingsLoadingState) {
      return _buildLoadingWidget();
    } else if (state is AppSettingsErrorState) {
      return _buildErrorWidget();
    } else if (state is AppSettingsLoadedState) {
      return _buildLoadedWidget(context: context, state: state);
    } else {
      return Container();
    }
  }

  Widget _buildLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorWidget() {
    return Container();
  }

  Widget _buildLoadedWidget({required BuildContext context, required AppSettingsLoadedState state}) {
    return const Column(
      children: [
        AdminLanguageList(),
      ],
    );
  }
}
