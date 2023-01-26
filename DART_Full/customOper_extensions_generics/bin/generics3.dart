void main(List<String> args) {
  sort();
  sort(false);
  print('----------------------');
  print(1.toInt() == 1);
  print((2.2).toInt() == 2);
  print((2.0).toInt() == 2);
  print('3'.toInt() == 3);
  print(['4', '5'].toInt() == 9);
  print(['2.4', '3.5'].toInt() == 6);
  print([4, 5].toInt() == 9);
  print('----------------------');
  final person = personThing.mapIfOfType(
        (Person p) => p.name,
      ) ??
      'Unknown person name';
  print(person);
  print('----------------------');
  const integers1 = [100, 5, 2];
  const doubles1 = [33.2, 53.2, 1.9];
  print(integers1.reduce(divide));
  print(doubles1.reduce(divide));
  print('----------------------');
}

//Creating generics on functions which can actually compare values
const ages = [100, 20, 90, 40];
const names = ['Foo', 'Bar', 'Baz'];
const distances = [3.1, 10.2, 1.3, 4.2];

int isLessThan<T extends Comparable>(T a, T b) => b.compareTo(a);
int isGreaterThan<T extends Comparable>(T a, T b) => a.compareTo(b);

void sort([bool ascending = true]) {
  final comparator = ascending ? isGreaterThan : isLessThan;

  print([...ages]..sort(comparator));
  print([...names]..sort(comparator));
  print([...distances]..sort(comparator));
}

//function to convert any object to an integer like, list of doubles to int

extension ToInt on Object {
  int toInt() {
    final list = [
      if (this is Iterable<Object>)
        ...this as Iterable<Object>
      else if (this is int)
        [this as int]
      else
        (double.tryParse(toString()) ?? 0.0).round()
    ];

    return list
        .map((e) => (double.tryParse(e.toString()) ?? 0.0).round())
        .reduce((lhs, rhs) => lhs + rhs);
  }
}

//Create a generic on any data type and try to map that data type



class Person extends Thing {
  final int age;

  const Person({required String name, required this.age}) : super(name: name);
}

class Animal extends Thing {
  final String species;

  const Animal({required String name, required this.species})
      : super(name: name);
}

const Thing personThing = Person(name: 'Dowe', age: 25);
const Thing animalThing = Animal(name: 'fishy', species: 'fish');

extension<T> on T {
  R? mapIfOfType<E, R>(R Function(E) f) {
    final shadow = this;
    if (shadow is E) {
      return f(shadow);
    } else {
      return null;
    }
  }
}

//Generic function pointers
T divide<T extends num>(T lhs, T rhs) {
  if (lhs is int && rhs is int) {
    return lhs ~/ rhs as T;
  } else {
    return lhs / rhs as T;
  }
}
