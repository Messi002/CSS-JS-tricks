// ignore_for_file: public_member_api_docs, sort_constructors_first
class Node<T> {
  T value;
  Node<T>? next;

  Node({
    required this.value,
    this.next,
  });

  @override
  String toString() {
    if (next == null) return '$value -> null';
    return '$value -> ${next.toString()}';
  }
}

class Linkedlist<E> {
  Node<E>? head;
  Node<E>? tail;

  Linkedlist({
    this.head,
    this.tail,
  });

  bool get isEmpty => head == null;

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  @override
  String toString() {
    if (isEmpty) return 'empty list';
    return head.toString();
  }
}

void main(List<String> args) {
  final list = Linkedlist<int>();

  list.push(3);
  list.push(2);
  list.push(1);

  print(list);
}
