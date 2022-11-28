




import 'package:app4/strings.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordTextField({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      obscureText: true,
      obscuringCharacter: '*',
  decoration: const InputDecoration(
    hintText: enterYourPasswordHere,
  ),
    );
  }
}
