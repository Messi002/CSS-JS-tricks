// import 'dart:async';
// import 'package:app4/user.dart';
// import 'package:uuid/uuid.dart';

// class UserRepository {
//   UserModel? _user;

//   Future<UserModel?> getUser() async {
//     if (_user != null) return _user;
//     return Future.delayed(
//         const Duration(milliseconds: 300), () => _user = UserModel(const Uuid().v4()));
//   }
// }
