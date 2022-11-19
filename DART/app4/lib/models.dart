// ignore_for_file: public_member_api_docs, sort_constructors_first
//loginhandle could be a token, anything to tell
//the user that he's registered or not

import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandle {
  final String token;
  
 const LoginHandle({
    required this.token,
  });

}
