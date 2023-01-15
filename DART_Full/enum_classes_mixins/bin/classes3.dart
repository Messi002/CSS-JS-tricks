//Factory constructor can create instances of their sub-classes
//A normal constructor of a class can create only an instance of that class

void main(List<String> args) {}

class Vehicle {
  const Vehicle();
}

class Car extends Vehicle {
  const Car();
}
