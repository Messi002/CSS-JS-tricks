// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' show immutable;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;

const Map<String, AuthError> authErrorMapping = {};

@immutable
abstract class AuthError {
  final String dialogTitle;
  final String dialogText;

  const AuthError({
    required this.dialogTitle,
    required this.dialogText,
  });

  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();
}

///This is called when the incoming error doesn't exist in firebaseAuthException
@immutable
class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown()
      : super(
            dialogTitle: 'Authentication error',
            dialogText: 'Unknown authentication error');
}

@immutable

///This is called when a user account doesn't exist and someone tries to delete it
class AuthErrorNoCurrentUser extends AuthError {
  const AuthErrorNoCurrentUser()
      : super(
            dialogText: 'No current user with this information was found!',
            dialogTitle: 'No current user!');
}

@immutable
///This is called when the user hasn't logged in like for a year and his token has expired
///so user is required to logout and login again to receive a new login_token
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin()
      : super(
          dialogTitle: 'Requires recent login!',
          dialogText:
              'You need to log out and log back in again in order to perform this operation',
        );
}

@immutable
///This error occurs when a particular sign-in provider(email_password for this case) hasn't been enabled
class AuthErrorOperationAllowed extends AuthError {
  const AuthErrorOperationAllowed()
      : super(
          dialogTitle: 'Operation not allowed!',
          dialogText:
              'You cannot register using this method at this moment!',
        );
}


@immutable
///This error occurs when a user tries to login when the user hasn't been registered yet
class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
          dialogTitle: 'User not found!',
          dialogText:
              'The given user was not found on the server!',
        );
}

@immutable
class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword()
      : super(
          dialogTitle: 'Weak password',
          dialogText:
              'Please choose a stronger password consisting of more characters!',
        );
}

@immutable
class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          dialogTitle: 'Invalid email',
          dialogText:
              'Please double check your email and try again',
        );
}

@immutable
class AuthErrorEmailAlreadyInUse extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          dialogTitle: 'Email already in use',
          dialogText:
              'Please choose another email to register with!',
        );
}