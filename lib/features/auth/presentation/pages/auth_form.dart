import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  bool _isRegister = false;

  void _switchAuthMode() {
    setState(() {
      _isRegister = !_isRegister;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Обработать форму (регистрация или вход)
      // ...

      // Очистить поля ввода
      _emailController.clear();
      _passwordController.clear();
      _usernameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите адрес электронной почты';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Пароль'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите пароль';
              }
              return null;
            },
          ),
          if (_isRegister)
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Имя пользователя'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите имя пользователя';
                }
                return null;
              },
            ),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text(_isRegister ? 'Зарегистрироваться' : 'Войти'),
          ),
          TextButton(
            onPressed: _switchAuthMode,
            child: Text(_isRegister ? 'Войти' : 'Зарегистрироваться'),
          ),
        ],
      ),
    );
  }
}