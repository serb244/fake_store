import 'package:fake_store/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injector.dart';
import '../../../home/presentation/manager/home_bloc.dart';

class DrawerAdminCategoryMenu  extends StatelessWidget {
  const DrawerAdminCategoryMenu ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(children: [
        IconButton(onPressed: () {
context.pushNamed(RouteConstants.adminCategoryName, pathParameters: {'categoryId': '1'});
        }, icon: const Icon(Icons.edit),),
        // TODO сделать pathParameters: {'categoryId': необязательно'}
        IconButton(onPressed: () {
context.pushNamed(RouteConstants.adminCategoryName, pathParameters: {'categoryId': '0'}) .then((value) => injector<HomeBloc>()..add(const HomeInitEvent()));
        }, icon: const Icon(Icons.add),),
      ],),
    );
  }
}
