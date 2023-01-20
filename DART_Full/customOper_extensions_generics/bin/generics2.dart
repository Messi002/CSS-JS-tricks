void main(List<String> args) {
  final person = Person(height: 20);
  final dog = Dog(height: 3);
  print(person.height);
  print(dog.height);
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

//Generic extensions

class Tuple<L, R> {
  final L left;
  final R right;

  const Tuple(this.left, this.right);

  @override
  String toString() => 'Tuple left = $left, right = $right';
}
