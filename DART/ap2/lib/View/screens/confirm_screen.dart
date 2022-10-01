import 'dart:html';

import 'package:flutter/material.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  ConfirmScreen({super.key, required this.videoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setvolume(1);
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
