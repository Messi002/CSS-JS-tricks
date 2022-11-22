// ignore_for_file: unnecessary_late

import 'dart:async';

import 'package:app4/dialogs/loading_screen_controller.dart';
import 'package:flutter/widgets.dart';

class LoadingScreen {
  //creating a singleton
  LoadingScreen._sharedInstance();
  // ignore: prefer_const_constructors
  static late final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _shared;

  LoadingScreenController? _controller;

  LoadingScreenController showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final _text = StreamController<String>();
    _text.add(text);
  }
}
