import 'package:app4/bloc/person.dart';
import 'package:flutter/foundation.dart' show immutable;

const persons1Url = 'http://127.0.0.1:5500/app4/api/person1.json';
const persons2Url = 'http://127.0.0.1:5500/app4/api/person2.json';

typedef PersonsLoader = Future<Iterable<Person>> Function(String url);

@immutable
abstract class LoadAction {
  const LoadAction();
}

class LoadPersonAction implements LoadAction {
  final String url;
  final PersonsLoader loader;
  const LoadPersonAction({
    required this.url,
    required this.loader,
  }) : super();
}
