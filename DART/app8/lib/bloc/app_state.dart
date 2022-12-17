// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppState {
  final bool isLoading;
  final Uint8List? data;
  final Object? error;

  const AppState({
    required this.isLoading,
    required this.data,
    required this.error,
  });

//initial app state
  const AppState.empty()
      : isLoading = false,
        data = null,
        error = null;

  @override
  String toString() => {
    'isLoading' : isLoading,
    'hasData' : data != null,
    'error' : error,
  }.toString();
}
