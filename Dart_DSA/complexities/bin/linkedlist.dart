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

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }

    tail!.next = Node(value: value);

    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    Node<E>? currentNode = head;
    int currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex + 1;
    }

    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
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

  // list.append(1);
  // list.append(2);
  // list.append(3);

  print('Before: $list');
var middleNode = list.nodeAt(1)!;
list.insertAfter(middleNode, 42);
print('After: $list');

  print(list);
}
