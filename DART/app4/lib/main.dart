import 'package:app4/apis/login_api.dart';
import 'package:app4/apis/notes_api.dart';
import 'package:app4/bloc/actions.dart';
import 'package:app4/bloc/app_state.dart';
import 'package:app4/dialogs/generic_dialog.dart';
import 'package:app4/dialogs/loading_screen.dart';
import 'package:app4/models.dart';
import 'package:app4/strings.dart';
import 'package:app4/views/iterable_list_view.dart';
import 'package:app4/views/login_view.dart';
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
            //showing errors
            final loginError = appState.loginError;
            if (loginError != null) {
              showGenericDialog(
                context: context,
                title: loginErrorDialogTitle,
                content: loginErrorDialogContent,
                optionsBuilder: () => {ok: true},
              );
            }
            //if we are logged in and don't have any notes fetched, fetch then now
            if (appState.isLoading == false &&
                appState.loginError == null &&
                appState.loginHandle == const LoginHandle.fooBar() &&
                appState.fetchNotes == null) {
              context.read<AppBloc>().add(const LoadNotesAction());
            }
          },
          builder: (context, appState) {
            final notes = appState.fetchNotes;
            if (notes == null) {
              return LoginView(
                onLoginTapped: (String email, String password) {
                  context
                      .read<AppBloc>()
                      .add( LoginAction(email: email, password: password));
                },
              );
            } else {
              return notes.toListView();
            }
          },
        ),
      ),
    );
  }
}
