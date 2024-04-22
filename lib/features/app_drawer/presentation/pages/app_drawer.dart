import 'package:fake_store/features/app_drawer/presentation/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/routes/route_constants.dart';
import '../manager/app_drawer_category_list_bloc.dart';
import '../widgets/drawer_admin_category_menu.dart';

class AppDrawer extends StatefulWidget {
  final bool isAdmin = true;

  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Row(
                children: [
                  const Text('Categories'),
                  widget.isAdmin
                      ? IconButton(
                          onPressed: () => context.pushNamed(RouteConstants.adminCategoryName, pathParameters: {'categoryId': '0'}),
                          icon: const Icon(Icons.add),
                        )
                      : const SizedBox.shrink()
                ],
              ),
              children: <Widget>[
                BlocConsumer<AppDrawerCategoryListBloc, AppDrawerCategoryListState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AppDrawerCategoryListLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is AppDrawerCategoryListErrorState) {
                        return Center(
                          child: Text(state.error),
                        );
                      } else if (state is AppDrawerCategoryListSuccessState) {
                        return AppDrawerCategoryList(
                          allCategories: state.allCategories,
                          parentId: null,
                        );
                      } else {
                        return Container();
                      }
                    }),
              ],
            ),
            ExpansionTile(
              title: const Text('ExpansionTile 2'),
              subtitle: const Text('Custom expansion arrow icon'),
              trailing: Icon(
                _customTileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
              ),
              children: const <Widget>[
                ListTile(title: Text('This is tile number 2')),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
            const ExpansionTile(
              title: Text('ExpansionTile 3'),
              subtitle: Text('Leading expansion arrow icon'),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                ListTile(title: Text('This is tile number 3')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
