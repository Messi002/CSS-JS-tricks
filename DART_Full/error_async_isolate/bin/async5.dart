//Using asyncMap and fold on it

import 'dart:async';

void main(List<String> args) async {
  final result = await getNames()
      .asyncMap((name) => extractCharacters(name))
      .fold('', (previous, element) {
    final elements = element.join(' ');
    return '$previous $elements ';
  });

  // print(result);
  print('-----------');
  final result1 = getNames().asyncExpand((value) => times3(value));
  await for (var name in result1) {
    // print(name);
  }
  print('-----------');
  broadcastStreamExample();
  print('-----------');
  print('-----------');
}

Stream<String> getNames() async* {
  yield 'Austin';
  yield 'Gareth';
  yield 'Doe';
}

Future<List<String>> extractCharacters(String str) async {
  final characters = <String>[];
  for (var character in str.split('')) {
    await Future.delayed(const Duration(milliseconds: 100));
    characters.add(character);
  }

  return characters;
}

Stream<String> times3(value) =>
    Stream.fromIterable(Iterable.generate(3, (_) => value));

//Broadcast stream...

Future<void> broadcastStreamExample() async {
  late final StreamController<String> controller;

  controller = StreamController<String>.broadcast();

  final sub1 = controller.stream.listen((name) {
    print("sub1: $name");
  });

  final sub2 = controller.stream.listen((name) {
    print("sub2: $name");
  });

  controller.sink.add('Austin');
  controller.sink.add('Gareth');
  controller.sink.add('Carine');
  controller.close();

  controller.onCancel = () {
    sub1.cancel();
    sub2.cancel();
  };
}
