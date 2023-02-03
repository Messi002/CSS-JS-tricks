//handling errors in streams...

import 'dart:async';

void main(List<String> args) async {
  print('-----------');
  //Method_1
  await for (var name in getNames().absorbErrorsUsingHandleError()) {
    print(name);
  }
  print('##############');

  await for (var name in getNames().absorbErrorsUsingHandlers()) {
    print(name);
  }
  print('##############');
    await for (var name in getNames().absorbErrorsUsingTransformer()) {
    print(name);
  }
  print('-----------');
  print('-----------');
}

extension AbsorbErrors<T> on Stream<T> {
  Stream<T> absorbErrorsUsingHandleError() => handleError((_, __) {});

  Stream<T> absorbErrorsUsingHandlers() =>
      transform(StreamTransformer.fromHandlers(
          handleError: ((_, __, sink) => sink.close())));

  Stream<T> absorbErrorsUsingTransformer() =>transform(StreamErrorAbsorber());
     
}

Stream<String> getNames() async* {
  yield 'Austin';
  yield 'Gareth';
  throw 'All out of names';
}

class StreamErrorAbsorber<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    final controller = StreamController<T>();
    stream.listen(
      controller.sink.add,
      onError: (_) {},
      onDone: controller.close,
    );
    return controller.stream;
  }
}
