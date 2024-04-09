import 'package:fake_store/core/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextButton(
            onPressed: () {
              context.goNamed(RouteConstants.categoryName);
            },
            child: Text("category"))
      ]),
    );
  }
}
