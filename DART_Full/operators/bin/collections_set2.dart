//For this example the person and dog instances have
//the same hash code but different when it comes to operator
//For example if different instances of a person are placed in a set and printed then
//we see that only one person instance is left but if a person and dog instance are in the
//set then both of them are left in the set.

void main(List<String> args) {
  final person = Person(name: 'Foo', age: 10);
  // final person1 = Person(name: 'Foo', age: 10);
  final dog = Dog(name: 'Foo', age: 10);

  print(person.hashCode);
  print(dog.hashCode);

  final beings = {person, dog};
  print(beings);
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  @override
  String toString() => 'Person: $name, $age';

//Just because the hash value of an object is the same
//it doesn't necessarily mean it is considered to be equal
  @override
  int get hashCode => Object.hash(name, age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && name == other.name && age == other.age;
}

class Dog {
  final String name;
  final int age;

  Dog({required this.name, required this.age});

  @override
  String toString() => 'Dog: $name, $age';

//Just because the hash value of an object is the same
//it doesn't necessarily mean it is considered to be equal
  @override
  int get hashCode => Object.hash(name, age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dog && name == other.name && age == other.age;
}
