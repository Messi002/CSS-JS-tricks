import 'package:app4/models.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}

@immutable
class LoginApi implements LoginApiProtocol {
  //for creating a singleton...
  // const LoginApi._sharedInstance();
  // static const LoginApi _shared = LoginApi._sharedInstance();
  // factory LoginApi.instance() => _shared;

  @override
  Future<LoginHandle?> login({
    required String email,
    required String password,
  }) =>
      Future.delayed(
              const Duration(seconds: 3),
              () =>
                  email == 'austingareth@gmail.com' && password == 'austin123',)
          .then((isLoggedIn) => isLoggedIn ? const LoginHandle.fooBar() : null);
}
