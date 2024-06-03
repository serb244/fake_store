import 'package:flutter/material.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/utils/request/request.dart';
import '../../data/data_source/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../manager/auth_bloc.dart';

enum AuthScreenType { login, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth Screen")),
      body:  Center(child: TextButton(onPressed: ()async {
        String mail = "mail34333@sdf.com";
        String password = "password";
    final res =await   AuthRemoteDataSourceImpl(apiClient:  injector<ApiClient>()).register(email: mail, password: password);
    print("res: $res");
      } , child: const Text("Login"))),
    );
  }
}
