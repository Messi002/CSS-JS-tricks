import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

enum PersonsUrl { person1, person2 }

extension UrlString on PersonsUrl {
  String get urlString {
    switch (this) {
      case PersonsUrl.person1:
         return 'http://127.0.0.1:5500/app4/api/person1.json';
      case PersonsUrl.person2:
        return 'http://127.0.0.1:5500/app4/api/person2.json';
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
