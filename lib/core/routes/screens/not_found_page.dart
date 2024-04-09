import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../route_constants.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {context.go(RouteConstants.homePath);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: const Center(
        child: Text('No Page Found'),
      ),
    );
  }
}
