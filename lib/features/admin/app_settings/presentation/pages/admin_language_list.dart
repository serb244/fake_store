import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_constants.dart';
import '../manager/language_bloc.dart';

class AdminLanguageList extends StatefulWidget {
  const AdminLanguageList({super.key});

  @override
  State<AdminLanguageList> createState() => _AdminLanguageListState();
}

class _AdminLanguageListState extends State<AdminLanguageList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageBloc, LanguageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is LanguageLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LanguageErrorState) {
          return Center(child: Text(state.error));
        } else if (state is LanguageLoadedState) {
          return ExpansionTile(
            title: Row(
              children: [
                const Text('Language'),
                IconButton(
                  onPressed: () => context.pushNamed(RouteConstants.adminLanguageDetailName),
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            subtitle: const Text('Choose Language'),
            children: <Widget>[
              state.languageList.isEmpty
                  ? const Text('No Language')
                  : DropdownButtonFormField<int>(
                      value: state.languageList[0].id,
                      items: state.languageList
                          .map((language) => DropdownMenuItem<int>(
                                value: language.id,
                                child: Text("${language.id} ${language.name} ${language.code}"),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      hint: const Text('Choose Language'),
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
