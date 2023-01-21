void main(List<String> args) {
  final person = Person(height: 20);
  final dog = Dog(height: 3);
  print(person.height);
  print(dog.height);
  print('-------------------');
  final tuple = Tuple(1, 2);
  final swapped = tuple.swap();
  print(tuple);
  print(swapped);

//Generic extensions on classes

class Tuple<L, R> {
  final L left;
  final R right;

  const Tuple(this.left, this.right);

  @override
  String toString() => 'Tuple left = $left, right = $right';
}

extension<L, R> on Tuple<L, R> {
  Tuple<R, L> swap() => Tuple(right, left);
}

extension<L extends num, R extends num> on Tuple<L, R> {
  num get sum => left + right;
}
