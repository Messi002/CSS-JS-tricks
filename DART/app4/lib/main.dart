import 'package:app4/apis/login_api.dart';
import 'package:app4/apis/notes_api.dart';
import 'package:app4/bloc/app_state.dart';
import 'package:app4/dialogs/loading_screen.dart';
import 'package:app4/strings.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        loginApi: LoginApi(),
        noteApi: NotesApi(),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        body: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            //loading state
            if (appState.isLoading) {
              LoadingScreen.instance().show(context: context, text: pleaseWait);
            } else {
              LoadingScreen.instance().hide();
            }
          },
          builder: (context, appState) {
            return Container();
          },
        ),
      ),
    );
  }
}
