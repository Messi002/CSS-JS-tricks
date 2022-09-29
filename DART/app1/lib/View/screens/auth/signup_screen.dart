// ignore_for_file: prefer_const_constructors

import 'package:app1/View/widgets/text_input_field.dart';
import 'package:app1/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tiktok Clone',
              style: TextStyle(
                  fontSize: 15,
                  color: kButtonColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Register',
              style: TextStyle(
                  fontSize: 35,
                  color: kButtonColor,
                  fontWeight: FontWeight.bold),
            ),
            Stack(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                  backgroundColor: Colors.black,
                ),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.add_a_photo)))
              ],
            ),
            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextInputField(
                  controller: _usernameController,
                  labelText: "Username",
                  icon: Icons.person),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextInputField(
                  controller: _emailController,
                  labelText: "Email",
                  icon: Icons.email_rounded),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextInputField(
                  controller: _passwordController,
                  labelText: "Password",
                  icon: Icons.lock_rounded),
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: kButtonColor,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: InkWell(
                  onTap: () {
                    debugPrint('welceome');
                  }, //TODO: HERE
                  child: const Center(
                      child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ))),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    }, //TODO: HERE
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: kButtonColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
