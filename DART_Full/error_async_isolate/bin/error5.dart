void main(List<String> args) {}

class Person {
  int _age;
  Person({required int age}) : _age = age;

  int get age => _age;

  set age(int value) {
    if (value < 0) {
      throw ArgumentError('Age cannot be negative');
    }
    _age = value;
  }
}
