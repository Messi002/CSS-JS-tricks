//abstract classes are blue prints of a blue print

void main(List<String> args) {
  const car = Car();
  print(car);
}

abstract class Vehicle {
  final VehicleKind kind;

  const Vehicle({required this.kind});

  void accelerate() => print('$kind is accelerating...');
  void decelerate() => print('$kind is decelerating...');
}

enum VehicleKind {
  motorcycle,
  bicycle,
    car,
  truck,
}

//implementing abstracting classes : means to re-implement all of his abstract methods

class Motorcycle implements Vehicle {
  @override
  void accelerate() => 'Motorcycle is accelerating...';

  @override
  void decelerate() => 'Motorcycle is decelerating...';

  @override
  VehicleKind get kind => VehicleKind.motorcycle;
}

//extending abstracting classes

class Car extends Vehicle {
  const Car() : super(kind: VehicleKind.car);

  @override
  String toString() => 'car is ${kind.index}';
}
