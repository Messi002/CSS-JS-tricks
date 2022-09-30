import 'dart:io';
import 'package:app1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //upload to firestorage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //registering the user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save user to firebase
        UserCredential userCred =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
       String downloadUrl = await _uploadToStorage(image);
      }
    } catch (e) {
      Get.snackbar("Error creating account", e.toString());
    }
  }
}
