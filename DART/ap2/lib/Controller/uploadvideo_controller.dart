import 'package:ap2/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UpLoadVideoController extends GetxController {

  //to compress video using a package called video_compress
  _compressVideo()async{
    final compressedVideo = await VideoCompress.compressVideo(videoPath, quality:VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }


  _uploadVideoToStorage(String id, String videoPath) async{
    ///to create the folder in the database
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    ref.putFile(await _compressVideo(videoPath));

  }

  //function to upload video...
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      //get id
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      _uploadVideoToStorage("Video $len", videoPath);
    } catch (e) {}
  }
}
