import 'dart:io';

import 'package:app5/auth/auth_error.dart';
import 'package:app5/utils/upload_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/rendering.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(const AppStateLoggedOut(
          isLoading: false,
        )) {
    //go to registration view
    on<AppEventGoToRegistration>(
      (event, emit) {
        emit(const AppStateIsInRegistrationView(isLoading: false));
      },
    );
    //log in the user
    on<AppEventLogIn>(
      (event, emit) async {
        //loading state
        emit(const AppStateLoggedOut(isLoading: true));
        //log user in
        try {
          final email = event.email;
          final password = event.password;
          final userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          final user = userCredential.user!;
          final images = await _getImages(user.uid);
          emit(AppStateLoggedIn(isLoading: false, user: user, images: images));
        } on FirebaseAuthException catch (e) {
          emit(AppStateLoggedOut(
              isLoading: false, authError: AuthError.from(e)));
        }
      },
    );
//go to log in screen
    on<AppEventGoToLogin>(
      (event, emit) {
        debugPrint('app event go to login screen called');
        emit(const AppStateLoggedOut(isLoading: false));
      },
    );
    //register user
    on<AppEventRegister>(
      (event, emit) async {
        emit(
          const AppStateIsInRegistrationView(
            isLoading: true,
          ),
        );
        final email = event.email;
        final password = event.password;

        try {
          //create user
          UserCredential credentials = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          emit(AppStateLoggedIn(
              isLoading: false, user: credentials.user!, images: const []));
        } on FirebaseAuthException catch (e) {
          emit(AppStateIsInRegistrationView(
              isLoading: false, authError: AuthError.from(e)));
        }
      },
    );

    //Tells the bloc to initialize itself
    on<AppEventInitialize>(
      (event, emit) async {
        //Here there's no loading because the firebaseAuth function
        //isn't asynchronous
        //get current user
        final user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          emit(const AppStateLoggedOut(isLoading: false));
        } else {
          //go grab the uploaded images
          final images = await _getImages(user.uid);
          emit(AppStateLoggedIn(isLoading: false, user: user, images: images));
        }
      },
    );
//Log the use out
    on<AppEventLogOut>((event, emit) async {
      emit(const AppStateLoggedOut(isLoading: true));

      //log user out
      await FirebaseAuth.instance.signOut();
      //log user out as well on the UI
      emit(const AppStateLoggedOut(isLoading: false));
    });

    ///Delete User account
    on<AppEventDeleteAccount>((event, emit) async {
//you can grab the current user through firebaseAuth or using state.user...
      final user = FirebaseAuth.instance.currentUser;
//log user out if we don't have an actual user in the app state
      if (user == null) {
        emit(const AppStateLoggedOut(isLoading: false));
        return;
      }
//Emitting a loading state...
      emit(AppStateLoggedIn(
        isLoading: true,
        user: user,
        images: state.images ?? [],
      ));
//delete user folder
      try {
        //delete the said folder
        final folder = await FirebaseStorage.instance.ref(user.uid).listAll();
        for (var elt in folder.items) {
          await elt.delete().catchError((_) {});
        }
        //delete folder itself
        await FirebaseStorage.instance
            .ref(user.uid)
            .delete()
            .catchError((_) {});
        //delete the user
        await user.delete();
        //log user out
        await FirebaseAuth.instance.signOut();
        //log user out as well on the UI
        emit(const AppStateLoggedOut(isLoading: false));
      } on FirebaseAuthException catch (e) {
        emit(AppStateLoggedIn(
            isLoading: true,
            user: user,
            images: state.images ?? [],
            authError: AuthError.from(e)));
      } on FirebaseException {
//we might not be able to delete the folder
//log the user out
        emit(const AppStateLoggedOut(isLoading: false));
      }
    });

    //handle uploading images
    on<AppEventUploadImage>((event, emit) async {
      final user = state.user;
//log user out if we don't have an actual user in the app state
      if (user == null) {
        emit(const AppStateLoggedOut(isLoading: false));
        return;
      }
//Emitting a loading state...
      emit(AppStateLoggedIn(
        isLoading: true,
        user: user,
        images: state.images ?? [],
      ));

//Uploading
      final file = File(event.filePathToUpload);

      await uploadImage(file: file, userId: user.uid);
//After uploading file is complete, grab the latest files
      final images = await _getImages(user.uid);
      emit(AppStateLoggedIn(isLoading: false, user: user, images: images));
    });
  }

  Future<Iterable<Reference>> _getImages(String userId) =>
      FirebaseStorage.instance
          .ref(userId)
          .list()
          .then((listResult) => listResult.items);
}
