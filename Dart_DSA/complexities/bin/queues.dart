abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

class QueueList<E> implements Queue<E> {
  List<E> _list;
  QueueList() : _list = <E>[];

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => (isEmpty) ? null : _list.first;

  @override
  String toString() => _list.toString();
}






void main(List<String> args) {
  final queue = QueueList<String>();

  queue.enqueue("Eric");
  queue.enqueue("Mary");
  queue.enqueue("John");
  queue.enqueue("Doe");

  print(queue);
  final val = queue.dequeue();
  print(val);
  print(queue.peek);
}
