import 'package:app5/bloc/app_bloc.dart';
import 'package:app5/extensions/if_debugging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterView extends HookWidget {
  const RegisterView({super.key});

 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
              keyboardAppearance: Brightness.dark,
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
              obscureText: true,
              obscuringCharacter: '🎯',
              keyboardAppearance: Brightness.dark,
            ),
            TextButton(
              onPressed: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                context.read<AppBloc>().add(
                      AppEventRegister(
                        email: email,
                        password: password,
                      ),
                    );
              },
              child: const Text("Register"),
            ),
            TextButton(
              onPressed: () {
                context.read<AppBloc>().add(const AppEventGoToLogin());
              },
              child: const Text("Already registered? Log in here!"),
            ),
          ],
        ),
      ),
    );
  }
}
