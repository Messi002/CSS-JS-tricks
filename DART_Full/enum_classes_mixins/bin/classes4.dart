//abstract classes are blue prints of a blue print

abstract class Vehicle {
  final VehicleKind kind;

 const Vehicle({required this.kind});
}

enum VehicleKind {car, motorcycle, bicycle, truck,}

//implementing abstracting classes 


//extending abstracting classes