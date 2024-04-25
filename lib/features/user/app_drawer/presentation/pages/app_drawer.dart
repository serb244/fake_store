import 'package:fake_store/features/user/app_drawer/presentation/widgets/drawer_admin_category_menu.dart';
import 'package:flutter/material.dart';
import '../widgets/category_list.dart';

class AppDrawer extends StatefulWidget {
  final bool isAdmin = true;

  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DrawerAdminCategoryMenu(),
              AppDrawerCategoryList(),
              ExpansionTile(
                initiallyExpanded: true,
                title: Text('ExpansionTile 2'),
                subtitle: Text('Custom expansion arrow icon'),
                // trailing: Icon(
                //   _customTileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
                // ),
                children: <Widget>[
                  ListTile(title: Text('This is tile number 2')),
                ],
              ),
              ExpansionTile(
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
      ),
    );
  }
}
