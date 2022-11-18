import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class LoadAction {
  const LoadAction();
}

class LoadPersonAction implements LoadAction {
  final PersonsUrl url;
  const LoadPersonAction({
    required this.url,
  }) : super();
}
