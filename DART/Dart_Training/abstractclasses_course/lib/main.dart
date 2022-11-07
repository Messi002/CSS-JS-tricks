import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum Type { cat, dog }

abstract class CanRun {
  // final Type type;
  // const CanRun({required this.type});


  // String get type {
  //   if (this is Cat) {
  //     return 'Cat';
  //   } else {
  //     return 'something else';
  //   }
  // }


  // @mustCallSuper
  void run() {
    'Running...'.log();
  }
}

class Dog extends CanRun {
  // const Dog() : super(type: Type.dog);
}

class Cat extends CanRun {
  // const Cat() : super(type: Type.cat);

  @override
  void run() {
    super.run();
    'Cat function called'.log();
  }
}

void testIt() {
  // const cat = Cat();
  // cat.type.log();
  // const dog = Dog();
  // dog.type.log();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      body: Container(),
    );
  }
}
