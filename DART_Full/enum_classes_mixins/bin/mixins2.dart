//Implementing equality with mixins
//Equality on mixins using UUID
import 'package:uuid/uuid.dart';

void main(List<String> args) {
  final uuid1 = const Uuid().v4();
  final uuid2 = const Uuid().v4();

  final person1 = Person(id: uuid1, name: 'John Doe', age: 25);
  final person2 = Person(id: uuid2, name: 'Angela Gilt', age: 20);

  if (person1 == person2) {
    print('Person 1 and Pesron 2 are equal');
  } else {
    print('Person 1 and Person 2 are not equal');
  }
}

mixin HasIdentifier {
  String get id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HasIdentifier &&
          other.runtimeType == runtimeType &&
          other.id == id;
}

class Person with HasIdentifier {
  @override
  final String id;

  final String name;
  final int age;

  Person({required this.id, required this.name, required this.age});
}
