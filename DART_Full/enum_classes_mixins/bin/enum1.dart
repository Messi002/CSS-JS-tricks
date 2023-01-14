//enhanced_enums are just enums with values...
// void main(List<String> args) {
//   final foo = Person(name: 'Foo', car: Car.teslaModelX);

//   switch (foo.car) {
//     case Car.teslaModelX:
//       print('Foo has a Tesla Model X = ${foo.car}');
//       break;
//     case Car.teslaModelY:
//       print('Foo has a Tesla Model Y = ${foo.car}');
//       break;
//   }
// }

// class Person {
//   final String name;
//   final Car car;

//   Person({required this.name, required this.car});
// }

// enum Car {
//   teslaModelX(
//     manufacturer: 'Telsa',
//     model: 'ModelX',
//     year: 2012,
//   ),

//   teslaModelY(
//     manufacturer: 'Telsa',
//     model: 'ModelY',
//     year: 2012,
//   );

//   final String manufacturer;
//   final String model;
//   final int year;

//   const Car({
//     required this.manufacturer,
//     required this.model,
//     required this.year,
//   });

//   @override
//   String toString() => 'Car: $manufacturer $model $year';
// }

//***************************** */
void main(List<String> args) {
  final whiskers = AnimalType.cat;
//This is used when we aren't interested in the other cases
  switch (whiskers) {
    case AnimalType.cat:
      print('This is a cat');
      break;
    default: 
    print('This is not a cat');
  }
}

enum AnimalType {
  rabbit,
  cat,
  dog,
}
