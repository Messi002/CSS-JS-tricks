import 'package:ap2/Controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

///[pages] to navigate to the different screens
const pages = <Widget>[
  Text('home screen'),
  Text('search screen'),
  Text('Add screen'),
  Text('message screen'),
  Text('profile screen'),
];

//COLORS
const kBackgroundColor = Colors.black;
var kButtonColor = Colors.red[400];
const kBorderColor = Colors.grey;

//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//CONTROLLERS
var authController = AuthController.instance;
