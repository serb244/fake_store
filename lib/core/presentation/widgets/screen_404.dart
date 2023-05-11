import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Screen404 extends StatelessWidget {
  const Screen404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context.router.current.name);
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('data')),
    );
  }
}
