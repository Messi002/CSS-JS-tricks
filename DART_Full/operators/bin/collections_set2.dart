void main(List<String> args) {}

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
  bool operator ==(Object other) {
    // TODO: implement ==
    return super == other;
  }
}
