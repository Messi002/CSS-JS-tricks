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

class LinkedList<T> {
  Node<T>? head;
  Node<T>? tail;

  LinkedList({this.head, this.tail});

  bool get isEmpty => head == null;

  void push(T value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(T value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail?.next = Node(value: value);

    tail = tail?.next;
  }

  @override
  String toString() {
    if (isEmpty) return 'empty linked_list';
    return head.toString();
  }
}

void main(List<String> args) {
  // final node1 = Node(value: 1);
  // final node2 = Node(value: 2);
  // final node3 = Node(value: 3);

  // node1.next = node2;
  // node2.next = node3;

  // print(node1);

  final linkedlist = LinkedList<int>();

  // linkedlist.push(3);
  // linkedlist.push(2);
  // linkedlist.push(1);

  linkedlist.append(1);
  linkedlist.append(2);
  linkedlist.append(3);

  print(linkedlist);
}
