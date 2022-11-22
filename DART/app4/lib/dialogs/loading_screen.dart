// ignore_for_file: unnecessary_late

import 'dart:async';

import 'package:app4/dialogs/loading_screen_controller.dart';
import 'package:flutter/material.dart';
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

    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    //displaying here
    final overlay = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black.withAlpha(150),
      );
    },);
  }
}
