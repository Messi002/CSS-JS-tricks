import 'dart:io';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //registering the user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null){
        //save user to firebase
      }
    } catch (e) {
      Get.snackbar("Error creating account", e.toString());
    }
  }
}
