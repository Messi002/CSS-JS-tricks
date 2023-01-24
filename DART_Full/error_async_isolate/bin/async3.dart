//Stream_controllers

import 'dart:async';

void main(List<String> args) async {
  final controller = StreamController<String>();

  controller.sink.add('Hello');
  controller.sink.add('world');

  await for (var value in controller.stream) {
    print(value);
  }

  controller.close();
}

//Stream transformer...
Stream<String> names = Stream.fromIterable([
  'John',
  'Jake',
  'Woods',
]);
