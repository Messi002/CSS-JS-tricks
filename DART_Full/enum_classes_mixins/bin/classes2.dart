void main(List<String> args) {
  final car = Car();

  try {
    car.drive(speed: 10);
    car.drive(speed: -1);
  } catch (e) {
    print(e);
  }
}

class Vehicle {
  final int wheelCount;

  const Vehicle(this.wheelCount);

  @override
  String toString() => '$runtimeType with $wheelCount wheels';
}

class Cars extends Vehicle {
  //if you don't create the super it is like you're creating a class without connecting it to its
  //parent at all, when it actually extends its parent
  const Cars() : super(4);
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

//This is useful when some heavy calculation is needed only when the getter property
//is called
  Person({required this.firstName, required this.lastName});
}



  void drive({required int speed}) {
    //This is how we set setters
    this.speed = speed;
    print('Accelerating to $speed km/h');
  }

  void stop() {
    speed = 0;

    print('Stopping...');
    print('Stopped!');
  }
}
