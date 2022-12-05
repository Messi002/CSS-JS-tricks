// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app4/models.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:collection/collection.dart';

extension UnorderedEquality on Object {
  bool isEqualTo(other) => const DeepCollectionEquality.unordered().equals(
        this,
        other,
      );
}

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
    final otherPropertiesAreEqual = isLoading == other.isLoading &&
        loginError == other.loginError &&
        loginHandle == other.loginHandle;

    if (fetchNotes == null && other.fetchNotes == null) {
      return otherPropertiesAreEqual;
    } else {
      return otherPropertiesAreEqual &&
          (fetchNotes?.isEqualTo(other.fetchNotes) ?? false);
    }
  }

  @override
  int get hashCode => Object.hash(
    isLoading,
    loginError,
    loginHandle,
    fetchNotes,
  );
}
