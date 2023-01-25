//Stream_controllers

import 'dart:async';

void main(List<String> args) async {
  // final controller = StreamController<String>();

  // controller.sink.add('Hello');
  // controller.sink.add('world');

  // await for (var value in controller.stream) {
  //   print(value);
  // }

  // controller.close();

//Stream transformer...
Stream<String> names = Stream.fromIterable([
  'John',
  'Jake',
  'Woods',
]);

extension on Stream<String> {
  Stream<String> get capitalized => transform(ToUpperCase());

  Stream<String> get capitalizedUsingMap => map((name) => name.toUpperCase());
}

class ToUpperCase extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.map((name) => name.toUpperCase());
  }
}
