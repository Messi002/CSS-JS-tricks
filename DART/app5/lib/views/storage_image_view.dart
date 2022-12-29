import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageImageView extends StatelessWidget {
  final Reference image;
  const StorageImageView({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(builder: builder);
  }
}
