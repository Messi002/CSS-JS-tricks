abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool? get isEmpty;
  E? get peek;
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];


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
  // TODO: implement isEmpty
  bool? get isEmpty => _list.isEmpty;
  
  @override
  // TODO: implement peek
  E? get peek => (isEmpty ?? false) ? null : _list.first ;
}
