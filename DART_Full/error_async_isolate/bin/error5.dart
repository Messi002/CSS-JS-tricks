void main(List<String> args) {
  final person = Person(age: 10);
  print(person);
  person.age = 0;
  print(person);

  try {
    person.age = -1;
    print(person);

  } 
  //If a second parameter is passed here, it is considered
  //as the stackTrace by Dart and that can be printed
  catch (e) {
    print(e);
  } finally {
    print('finally blocked reached');
  }
  
}

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

  @override
  String toString() => 'Person( age: $age)';
}

//Capturing stacktrace for exception
class DogIsTiredException implements Exception {
  final String message;

  DogIsTiredException([this.message = 'Poor doggy is tired']);
}


class Dog {
  final bool isTired;

  Dog({required this.isTired});

  @override
  void run() {
    if (isTired) {
      throw DogIsTiredException();
    }else {
      print('Dog is running...');
    }
  }
}
