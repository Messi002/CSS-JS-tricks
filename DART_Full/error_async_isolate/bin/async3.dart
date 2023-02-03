//Stream_controllers are read and write while a stream is read-only

import 'dart:async';

void main(List<String> args) async {
  // final controller = StreamController<String>();

  // controller.sink.add('Hello');
  // controller.sink.add('world');

  // await for (var value in controller.stream) {
  //   print(value);
  // }

  // controller.close();
  print('--------------------');
  await for (var name1 in names.capitalized) {
    print(name1);
  }
  print('--------------------');
  await for (var name2 in names.capitalizedUsingMap) {
    print(name2);
  }
  print('--------------------');
  final allNames = await getNames().toList();
  print(allNames);
  print('--------------------');
}

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

//A future out of a stream using a function called toList...
Stream<String> getNames() async* {
  yield 'Austin';
  yield 'Gareth';
  yield 'Aram';
}
