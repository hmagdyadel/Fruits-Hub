import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'loginView';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center( child: Text('Login View'), ),
    );
  }
}
