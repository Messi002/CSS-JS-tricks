import 'package:ap2/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UpLoadVideoController extends GetxController {
  //function to upload video...
  uploadVideo(String songName, String caption, String videopath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc('uid').get();
    } catch (e) {}
  }
}
