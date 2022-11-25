// ignore_for_file: public_member_api_docs, sort_constructors_first
//loginhandle could be a token, anything to tell
//the user that he's registered or not


import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandle {
  final String token;

  const LoginHandle({
    required this.token,
  });

  c

enum LoginErrors { invalidHandle }

@immutable
class Note {
  final String title;
  const Note({
    required this.title,
  });

  @override
  String toString() => 'Note(title: $title)';

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}

final mockNotes = Iterable.generate(3, (i) => Note(title: 'Note ${i + 1}'));
