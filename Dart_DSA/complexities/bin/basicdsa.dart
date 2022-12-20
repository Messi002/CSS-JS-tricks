class Stack<E> {
  final List<E> _storage;
  Stack() : _storage = <E>[];
  Stack.of(Iterable<E> elements) : _storage = List.of(elements);

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;
bool get isEmpty => _storage.isEmpty;
bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return '---Top---\n'
        '${_storage.reversed.join('\n')}'
        '\n------';
  }
}

void main(List<String> args) {
  // final stack = Stack<int>();
  // stack.push(1);
  // stack.push(2);
  // stack.push(3);
  // stack.push(4);

  // print(stack);
  // final elt = stack.pop();
  // print('Popped Elt: $elt');
// -----------------------------
//   List list = ['S', 'M', 'O', 'K', 'E'];
//   final smokeStack = Stack.of(list);
// print(smokeStack);
// smokeStack.pop();
// print(smokeStack);
//-------------------------------
}

bool checkBalanceParen(String sentence) {
  final stack = Stack();
 for (var i = 0; i < sentence.length; i++) {
   if
 }
}
