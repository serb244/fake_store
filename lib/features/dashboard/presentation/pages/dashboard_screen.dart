import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/navigation/dashboard_drawer_menu.dart';

@RoutePage()
class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawerMenu(),
      appBar: AppBar(),
      body: const Center(child: Text('data')),
    );
  }
}
