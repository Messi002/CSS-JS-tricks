import 'package:flutter/material.dart';

typedef OnLoginTapped = void Function(
  String email,
  String password,
);

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final OnLoginTapped onLoginTapped;

  const LoginButton({super.key, required this.emailController, required this.passwordController, required this.onLoginTapped});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
