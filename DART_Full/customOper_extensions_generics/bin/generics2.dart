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
  print(swapped.sum);
  print('-------------------');
}

//Generic mixins and Generic typedefs
mixin HasHeight<H extends num> {
  H get height;
}

//HasHeightDouble or HasHeightInt are actually mixins since they hold on to mixins
typedef HasHeightDouble = HasHeight<double>;
typedef HasHeightInt = HasHeight<int>;

class Person with HasHeightDouble {
  @override
  final double height;

  const Person({required this.height});
}

class Dog with HasHeightInt {
  @override
  final int height;

  Dog({required this.height});
}

//Generic extensions on classes


extension<L, R> on Tuple<L, R> {
  Tuple<R, L> swap() => Tuple(right, left);
}

extension<L extends num, R extends num> on Tuple<L, R> {
  num get sum => left + right;
}
