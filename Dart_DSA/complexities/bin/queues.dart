abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool? isEmpty;
  E? peek();
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];
  @override
  bool? isEmpty;

  @override
  E? dequeue() {
    // TODO: implement dequeue
    throw UnimplementedError();
  }

  @override
  bool enqueue(E element) {
    // TODO: implement enqueue
    throw UnimplementedError();
  }

  @override
  E? peek() {
    // TODO: implement peek
    throw UnimplementedError();
  }
}
