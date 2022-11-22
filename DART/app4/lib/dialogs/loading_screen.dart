// ignore_for_file: unnecessary_late

import 'package:app4/dialogs/loading_screen_controller.dart';

class LoadingScreen {
  //creating a singleton
   LoadingScreen._sharedInstance();
  // ignore: prefer_const_constructors
  static late final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _shared;

  LoadingScreenController? _controller;


}
