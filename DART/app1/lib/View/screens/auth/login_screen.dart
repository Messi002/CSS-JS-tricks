import 'package:app1/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children:<Widget> [
            Text('Tiktok Clone', style: TextStyle(fontSize: 35, color: kButtonColor, fontWeight: FontWeight.bold),),
            Text('Login', style: TextStyle(fontSize: 35, color: kButtonColor, fontWeight: FontWeight.bold),),
            SizedBox(height: 25),
            Container(
              child: ,
            ),
          ],
        ),
      ),
    );
  }
}