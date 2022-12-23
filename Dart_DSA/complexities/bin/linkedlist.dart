class Node<T> {
  T value;
  Node<T>? next;

  Node({
    required this.value,
    this.next,
  });

  @override
  String toString() {
    if (next == null) return 'value: $value -> null';
    return 'value: $value -> ${next.toString()}';
  }
}

void main(List<String> args) {
  final node1 = Node<int>(value: 1);
  final node2 = Node<int>(value: 2);
  final node3 = Node<int>(value: 3);

  node1.next = node2;
  node2.next = node3;

  print(node1);
}
