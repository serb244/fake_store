import 'package:fake_store/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerAdminCategoryMenu  extends StatelessWidget {
  const DrawerAdminCategoryMenu ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(children: [
        IconButton(onPressed: () {
context.goNamed(RouteConstants.adminCategoryName, pathParameters: {'categoryId': '1'});
        }, icon: Icon(Icons.edit),),
        // TODO сделать pathParameters: {'categoryId': необязательно'}
        IconButton(onPressed: () {
context.goNamed(RouteConstants.adminCategoryName, pathParameters: {'categoryId': '0'});
        }, icon: Icon(Icons.add),),
      ],),
    );
  }
}
