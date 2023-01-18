void main(List<String> args) {
  print('Foo Bar' - 'Bar');
  print('Bar' - 'Bar');
  print('Foo Bar' - 'Baz');
  print('----------------------');
  final sum = [1, 2, 3] - [3];
  print(sum);
  print('----------------------');
  final mergedMaps = {'name': 'John', 'age': 42} + {'address': '123 Main St.'};
  print('----------------------');
  final mom = Person(name: 'Jane');
  final dad = Person(name: 'John');
  final son = Person(name: 'Jack');
  final daughter = Person(name: 'Jill');

  final whiskers = Pet(name: 'Whiskers');

  final family = mom + dad;
  print(family);
  final withWhisksers = family & whiskers;
  print(withWhisksers);
}

//On Strings
extension Remove on String {
  String operator -(String other) => replaceAll(other, '');
}

//On Iterabes
extension RemoveIterable<T> on Iterable<T> {
  Iterable<T> operator -(Iterable<T> other) =>
      where((element) => !other.contains(element));
}

//On Maps
extension MapOperations<K, V> on Map<K, V> {
  Map<K, V> operator +(Map<K, V> other) => {...this, ...other};

  Map<K, V> operator -(Map<K, V> other) {
    //Using the spread operator we are actually creating a copy of the map and not mutating it directly
    return {...this}..removeWhere(
        (key, value) => other.containsKey(key) && other[key] == value);
  }

  Iterable<Map<K, V>> operator *(int times) sync* {
    // Yield* keyword is used for ‘returning’ recursive(or any iterable/stream with the same type) generator:
    // Yield is a keyword that ‘returns’ single value to the sequence, but does not stop the generator function.
    for (var i = 0; i < times; i++) {
      yield this;
    }
  }
}

//-------------------------------------------------------
class Person {
  final String name;

  const Person({required this.name});

  @override
  String toString() => 'Person (name = $name)';
}

class Pet {
  final String name;

  const Pet({required this.name});

  @override
  String toString() => 'Pet (name = $name)';
}

class Family {
  final List<Person> members;
  final List<Pet> pets;

  const Family({required this.members, required this.pets});

  @override
  String toString() => 'Family (members = $members, pets = $pets)';
}

extension on Person {
  Family operator +(Person other) => Family(members: [this, other], pets: []);

  //Dart doesn't allow function overload like swift or rust meaning we can't define other parameters using
  //the same operator + like so +(Pet other) not allowed in Dart

  Family operator &(Pet other) => Family(members: [this], pets: [other]);
}

extension on Family {
  Family operator &(Pet other) =>
      Family(members: members, pets: [...pets, other]);
  Family operator +(Person other) =>
      Family(members: [...members, other], pets: pets);
  Family operator ^(Family other) => Family(
      members: [...members, ...other.members], pets: [...pets, ...other.pets]);
}
