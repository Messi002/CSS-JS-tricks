import 'dart:async';

void main(List<String> args) async {
  try {
    await for (var name
        in getNames().withTimeOutBetweenEvents(const Duration(seconds: 3))) {
      print(name);
    }
  } on TimeoutBetweenEventException catch (e) {
    print("TimeOutBetweenEventExceptions: $e");
  }
}

Stream<String> getNames() async* {
  yield 'Austin';
  await Future.delayed(const Duration(seconds: 1));
  yield 'Gareth';
  await Future.delayed(const Duration(seconds: 10));

  yield 'Doe';
}

extension WithTimeOutBetweenEvents<T> on Stream<T> {
  Stream<T> withTimeOutBetweenEvents(Duration duration) =>
      transform(TimeOutBetweenEvents(duration: duration));
}

class TimeOutBetweenEvents<E> extends StreamTransformerBase<E, E> {
  final Duration duration;

  TimeOutBetweenEvents({required this.duration});

  @override
  Stream<E> bind(Stream<E> stream) {
    StreamController<E>? controller;
    StreamSubscription<E>? subscription;
    Timer? timer;

    controller = StreamController(
      onListen: () {
        subscription = stream.listen(
          (data) {
            timer?.cancel();
            timer = Timer.periodic(duration, (timer) {
              controller?.addError(TimeoutBetweenEventException('TimeOut...'));
            });
            controller?.add(data);
          },
          onError: controller?.addError,
          onDone: controller?.close,
        );
      },
      onCancel: () {
        subscription?.cancel();
        timer?.cancel();
      },
    );

    return controller.stream;
  }
}

class TimeoutBetweenEventException implements Exception {
  final String message;

  TimeoutBetweenEventException(this.message);
}
