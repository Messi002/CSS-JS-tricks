void main(List<String> args) {
  try {
    print('Dog aged 11 is going to run...');
    Dog(isTired: false, age: 11).run();
  } catch (e) {
    print(e);
  }
  print('----------------');
    try {
    print('A tired dog aged 2 is going to run...');
    Dog(isTired: true, age: 2).run();
  } catch (e) {
    print(e);
  }
}

//You can in dart annotate a function with a class
//a specific function throws a specific error, we are going to annotate them
//rather than documenting them(classes)
class Throws<T> {
  final List<T> exceptions;

  const Throws(this.exceptions);
}

class DogIsTooOldException implements Exception {
  const DogIsTooOldException();
}

class DogIsTiredException implements Exception {
  const DogIsTiredException();
}

class Animal {
  final int age;

  const Animal({required this.age});

//This is how annotation of errors is done...
  @Throws([UnimplementedError])
  void run() => throw UnimplementedError();
}

class Dog extends Animal {
  final bool isTired;

  Dog({required this.isTired, required super.age});

  @Throws([DogIsTiredException(), DogIsTooOldException()])
  @override
  void run() {
    if (age > 10) {
      throw const DogIsTooOldException();
    } else if (isTired) {
      throw const DogIsTiredException();
    } else {
      print('Dog is running...');
    }
  }
}
