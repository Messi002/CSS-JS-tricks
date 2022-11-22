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
    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
                maxHeight: size.height * 0.8,
                minWidth: size.width * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const CircularProgressIndicator(),
                      const SizedBox(height: 20),
                      StreamBuilder(
                          stream: _text.stream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!,
                                textAlign: TextAlign.center,
                              );
                            } else {
                              return Container();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
