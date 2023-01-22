void main(List<String> args) {}

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

  Animal({required this.age});

//This is how annotation of errors is done...
 @Throws([UnimplementedError])
  void run() => throw UnimplementedError();
}
