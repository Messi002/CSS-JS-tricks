// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppAction {
  const AppAction();
}



@immutable
class LoadNotesAction implements AppAction {
  const LoadNotesAction();
}
