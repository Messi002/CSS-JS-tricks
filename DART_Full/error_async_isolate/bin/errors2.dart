//Using rethrow in this case...

void main(List<String> args) {
  try {
    tryCreatingPesron(age: 10);
    print('----------------');
    tryCreatingPesron(age: -1);
    print('----------------');
    tryCreatingPesron(age: 150);
    print('----------------');
  } catch (e, strackTrace) {
    print('$e, stackTrace: $strackTrace');
  }
}

void tryCreatingPesron({int age = 0}) {
  try {
    print(Person(age: age).age);
  } on InvalidAgeException {
    //With rethrow the line with the error crahses the whole application 
    //and the other lines below it don't get executed
    rethrow;
  }
}

class Person {
  final int age;

  Person({required this.age}) {
    if (age < 0) {
      throw InvalidAgeException(age: age, message: 'Age cannot be negative.');
    } else if (age > 140) {
      throw InvalidAgeException(age: age, message: 'Age cannot be above 140.');
    }
  }
}

//custom exception classes, this time with rethrow
class InvalidAgeException implements Exception {
  final int age;
  final String message;

  InvalidAgeException({required this.age, required this.message});

  @override
  String toString() => 'InvalidAgeException(age: $age, message: $message)';
}
