//enhanced_enums are just enums with values...

enum Car {
  teslaModelX(
    manufacturer: 'Telsa',
    model: 'ModelX',
    year: 2012,
  ),

teslaModelY(
    manufacturer: 'Telsa',
    model: 'ModelY',
    year: 2012,
  );

  final String manufacturer;
  final String model;
  final int year;

 const Car({required this.manufacturer, required this.model, required this.year});
}
