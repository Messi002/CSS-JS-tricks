//Exceptions are meant to be caught  e.g. data from a user and passing it to the class and the class can't accept it
//while errors are not not meant to be caught they are programmers error...
//   e.g. a clearly defined range 0-100 and the user inputs 300 that's an error

void main(List<String> args) {
  tryCreatingPesron(age: 0);
  print('----------------');
  tryCreatingPesron(age: -1);
  print('----------------');
  tryCreatingPesron(age: 150);
  print('----------------');
}

void tryCreatingPesron({int age = 0}) {
  try {
    print(Person(age: age).age);
  } //catch (e) {
  //   print(e);
  // }
  on InvalidAgeException catch (e, stackTrace) {
    print('Exception:$e, stackTrace: $stackTrace');
  }
}

class Person {
  final int age;

  Person({required this.age}) {
    if (age < 0) {
      // throw Exception("Age can't be negative");
      throw InvalidAgeException(age: age, message: 'Age cannot be negative.');
    } else if (age > 140) {
      // print("Age can't be above 140");
      throw InvalidAgeException(age: age, message: 'Age cannot be above 140.');
    }
  }
}

//custom exception classes
class InvalidAgeException implements Exception {
  final int age;
  final String message;

  InvalidAgeException({required this.age, required this.message});

  @override
  String toString() => 'InvalidAgeException(age: $age, message: $message)';
}
