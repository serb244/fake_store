import 'package:fake_store/features/app_drawer/presentation/widgets/category_list.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injector.dart';
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
              title: Text('Category List'),
              subtitle:
              widget.isAdmin ? DrawerAdminCategoryMenu() :Text("data"),
              children: <Widget>[
                AppDrawerCategoryList(),
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
