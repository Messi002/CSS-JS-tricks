void main(List<String> args) {}

class Vehicle {
  final int wheelCount;

  const Vehicle(this.wheelCount);

  @override
  String toString() => '$runtimeType with $wheelCount wheels';
}

class Car extends Vehicle {
  //if you don't create the super it is like you're creating a class without connecting it to its
  //parent at all, when it actually extends its parent
  const Car() : super(4);
  //const Car() : super(4); means whenever someone calls the car constructor with will always have 4 wheels
  //while with Car(super.wheelCount) means anybody creating the Car constructor should pass it a wheel
  //which will be sent to the Vehicle
}

class Bicycle extends Vehicle {
  const Bicycle() : super(2);
}

//------------------------------------------------
//GETTERS AND SETTERS

// class Person {
  
//   final String firstName;
//   final String lastName;
//   final String fullNames;

//This way is used when some heavy calculation is to be done upon construction
//   Person({required this.firstName, required this.lastName}) : fullNames = '$firstName $lastName' ;

// }

class Person {
  final String firstName;
  final String lastName;
  String get fullNames => '$firstName $lastName';

  Person({required this.firstName, required this.lastName});
  
}