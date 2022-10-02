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
      CommentModel comment = CommentModel(datePublished: datePublished, username: username, comment: comment, likes: likes, photoUrl: photoUrl, uid: uid, id: id)
    }
  }
}
