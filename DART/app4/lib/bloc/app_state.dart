// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app4/models.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:collection/collection.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginErrors? loginError;
  final LoginHandle? loginHandle;
  final Iterable<Note>? fetchNotes;

//TODO; if faced with some type of errors add required to all the variables below
  const AppState({
    required this.isLoading,
    this.loginError,
    this.loginHandle,
    this.fetchNotes,
  });

  const AppState.empty()
      : isLoading = false,
        loginError = null,
        loginHandle = null,
        fetchNotes = null;

  @override
  String toString() {
    return 'AppState(isLoading: $isLoading, loginError: $loginError, loginHandle: $loginHandle, fetchNotes: $fetchNotes)';
  }

  @override
  bool operator ==(covariant AppState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading &&
        other.loginError == loginError &&
        other.loginHandle == loginHandle &&
        other.fetchNotes == fetchNotes;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        loginError.hashCode ^
        loginHandle.hashCode ^
        fetchNotes.hashCode;
  }
}

extension UnorderedEquality on Object {
  bool isEqualTo(other) =>
      const DeepCollectionEquality.unordered().equals(this, other,);
}
