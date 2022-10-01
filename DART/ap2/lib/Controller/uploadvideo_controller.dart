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


//precise function to upload video to firestorage and returning downloadUrl
  Future<String> _uploadVideoToStorage(String id, String videoPath) async{
    ///to create the folder in the database
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;

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
      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      _uploadImageToStorage("Video $len", videoPath);
    } catch (e) {}
  }
}
