import 'package:app4/models.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class NotesProtocolApi {
  const NotesProtocolApi();

  Future<Iterable<Note>?> getNotes({
    required LoginHandle loginHandle,
  });
}

@immutable
class NoteApi implements NotesProtocolApi {
  @override
  Future<Iterable<Note>?> getNotes({required LoginHandle loginHandle}) =>
      Future.delayed(
        const Duration(seconds: 3),
        () => loginHandle == const LoginHandle.fooBar() ? mockNotes : null,
      );
}
