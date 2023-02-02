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

enum AnimalType {
  rabbit,
  cat,
  dog,
}

void main(List<String> args) {
  final whiskers = AnimalType.cat;
//This is used when we aren't interested in the other cases
//avoiding using the default

//------------------
  // switch (whiskers) {
  //   case AnimalType.cat:
  //     print('This is a cat');
  //     break;
    //use it this way rather
    //  case AnimalType.dog:
    //  case AnimalType.rabbit:
    //     break;
    // OR this other method
    // default:
    //   print('This is not a cat');

      print('-----------------------------');
      describe(animalType(frmStr: 'cat'));
      describe(animalType(frmStr: 'dog'));
      describe(animalType(frmStr: 'rabbit'));
      describe(animalType(frmStr: 'bird'));
  // }
}

//****************CREATING_INSTANCES_FROM_ENUMS */
//How do you instantiate an enum type from let's say a JSON which is a string in to your application

void describe(AnimalType? animalType) {
  switch (animalType) {
    case AnimalType.rabbit:
      print('This is a rabbit');
      break;
    case AnimalType.cat:
      print('This is a cat');
      break;
    case AnimalType.dog:
      print('This is a dog');
      break;
    default:
      print('Unknown animal');
  }
}

AnimalType? animalType({required frmStr}) {
  try {
    return AnimalType.values.firstWhere((animal) => animal.name == frmStr,);
  } catch (e) {
    return null;
  }
}
