import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String photoUrl;
  String email;
  String uid;
  
  UserModel({
    required this.name,
    required this.photoUrl,
    required this.email,
    required this.uid,
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'photoUrl': photoUrl,
      'email': email,
      'uid': uid,
    };
  }

  static UserModel.fromSnap(DocumentSnapshot snap) {
    return UserModel(
      name: map['name'] as String,
      photoUrl: map['photoUrl'] as String,
      email: map['email'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

}
