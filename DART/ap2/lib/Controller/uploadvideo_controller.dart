import 'package:ap2/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UpLoadVideoController extends GetxController {


  _uploadVideoToStorage(String id, String videopath){
    Reference ref = firebaseStorage.ref().child('videos').child(id);

  }

  //function to upload video...
  uploadVideo(String songName, String caption, String videopath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      //get id
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      _uploadVideoToStorage("Video $len", videopath);
    } catch (e) {}
  }
}
