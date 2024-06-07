import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  void toggleFormMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Login' : 'Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              if (!isLogin)
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              if (!isLogin)
                TextField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (isLogin) {
                    // Perform login action
                  } else {
                    // Perform registration action
                  }
                },
                child: Text(isLogin ? 'Login' : 'Register'),
              ),
              TextButton(
                onPressed: toggleFormMode,
                child: Text(isLogin
                    ? 'Don\'t have an account? Register here.'
                    : 'Already have an account? Login here.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


