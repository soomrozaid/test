import 'package:fitbuds/login/login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String? errorMessage;
  const LoginPage({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginView(errorMessage: errorMessage,);
  }
}
