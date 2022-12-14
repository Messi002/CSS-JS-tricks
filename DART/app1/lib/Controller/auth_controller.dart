import 'dart:io';
import 'package:app1/Models/user_model.dart' as model;
import 'package:app1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
//returning to us an instance of the authcontroller
  static AuthController instance = Get.find();

//used for keeping track of the image which acts like a stream
  late Rx<File?> _pickedImage;

//getter function
  File? get profilePhoto => _pickedImage.value;

//for selecting an image
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture', 'Successfully loaded...');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  //upload to firestorage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child("profilePics")
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
        //save user credentials to firebase
        UserCredential userCred =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        //getting the downloadUrl from fireStorage...
        String downloadUrl = await _uploadToStorage(image);
        //using the created model to parse the object to json
        model.UserModel user = model.UserModel(
            email: email,
            name: username,
            uid: userCred.user!.uid,
            photoUrl: downloadUrl);
        //saving the data to firestore
        await firestore
            .collection('users')
            .doc(userCred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
            "Error creating account", 'Please Fill in all the fields...');
      }
    } catch (e) {
      Get.snackbar("Error creating account", e.toString());
    }
  }
}
