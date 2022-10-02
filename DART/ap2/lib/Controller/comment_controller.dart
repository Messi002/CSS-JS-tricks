import 'package:ap2/Models/comment_model.dart';
import 'package:ap2/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  final Rx<List<CommentModel>> _comments = Rx<List<CommentModel>>([]);
  List<CommentModel> get comments => _comments.value;

  String _postId = "";
  updatePostId(String id) {
    _postId = id;
    getComments();
  }

  getComments() async {}

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(authController.user!.uid)
          .get();
      var allDocs = await firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .get();
      int len = allDocs.docs.length;
      CommentModel comment = CommentModel(
        datePublished: DateTime.now(),
        username: (userDoc.data() as Map<String, dynamic>)['name'],
        comment: commentText.trim(),
        likes: [],
        photoUrl: (userDoc.data() as Map<String, dynamic>)['photoUrl'],
        uid: authController.user!.uid,
        id: 'Comment $len',
      );

      await firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .doc('Comments $len')
          .set(comment.toJson());
    }

    } catch (e) {
      Get.snackbar('Error while Commenting', e.toString());
    }

    
  }
}
