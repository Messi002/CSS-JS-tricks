import 'package:app4/views/email_text_field.dart';
import 'package:app4/views/login_button.dart';
import 'package:app4/views/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginView extends HookWidget {
  final OnLoginTapped onLoginTapped;
  const LoginView(this.onLoginTapped, {super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    fi
