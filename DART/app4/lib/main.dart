import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

@immutable
abstract class LoadAction {
  const LoadAction();
}

enum PersonUrl { person1, person2 }

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.person1:
        return 'http://127.0.0.1:5500/app4/api/person1.json';
      case PersonUrl.person2:
        return 'http://127.0.0.1:5500/app4/api/person2.json';
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late final Bloc myBloc;

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
    );
  }
}
