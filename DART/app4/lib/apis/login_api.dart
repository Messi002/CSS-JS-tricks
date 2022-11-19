import 'package:app4/models.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class LoginProtocolApi {
  const LoginProtocolApi();

  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}

@immutable
class LoginApi implements LoginProtocolApi {
  //for creating a singleton...
  const LoginApi._sharedInstance();
  static const LoginApi _shared = LoginApi._sharedInstance();
  factory LoginApi.instance() => _shared;


  @override
  Future<LoginHandle?> login(
      {required String email, required String password,}) => 


      
}
