//Creating custom operators inside Classes now not on extensions

void main(List<String> args) {}

class Person {
  final int age;

  const Person({required this.age});

  @override
  String toString() => 'Person (age = $age)';
}