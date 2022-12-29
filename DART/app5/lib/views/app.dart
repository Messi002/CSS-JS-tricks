import 'package:app5/bloc/app_bloc.dart';
import 'package:app5/dialogs/loading_screen.dart';
import 'package:app5/dialogs/show_auth_error.dart';
import 'package:app5/views/login_view.dart';
import 'package:app5/views/photo_gallery_view.dart';
import 'package:app5/views/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc()..add(const AppEventInitialize()),
      child: MaterialApp(
        title: 'Photo Library',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: 'Loading...',
              );
            } else {
              LoadingScreen.instance().hide();
            }

            final authError = appState.authError;
            if (authError != null) {
              showAuthError(
                authError: authError,
                context: context,
              );
            }
          },
          builder: (context, appState) {
            if (appState is AppStateLoggedIn) return const PhotoGalleryView();
            if (appState is AppStateLoggedOut) return const LoginView();
            if (appState is AppStateIsInRegistrationView)
              return const RegisterView();
            //this should never happen
            return Container();
          },
        ),
      ),
    );
  }
}
