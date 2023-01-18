//Creating custom operators inside Classes now not on extensions

void main(List<String> args) {
  final meThisYear = Person(age: 30);
  final meNextYear = Person(age: 30) + 1;
  print(meNextYear);
}

class Person {
  final int age;

  const Person({required this.age});

  Person operator +(int age) => Person(age: this.age + age);

  @override
  String toString() => 'Person (age = $age)';
}
