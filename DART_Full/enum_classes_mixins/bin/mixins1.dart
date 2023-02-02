import 'dart:mirrors';

//Limiting mixins to particular datatypes only


  cats.forEach(print);
  print('----------------------');
  final person = Person(name: 'John Doe', age: 30);
  print(person);
  final house = House(address: '123 Main St', rooms: 4);
  print(house);
}

//With this we can't call the `with CanRun` on the class below
//because the mixin says I'm only available on any class that extends Has2Feet
class Has2Feet {
  const Has2Feet();
}

mixin CanRun on Has2Feet {
  void run() {
    print('$runtimeType is running...');
  }
}

class Human extends Has2Feet with CanRun {
  const Human();
}

//--------------------------------------------------
//Mixin bringing in hash code (VERY USEFUL)
enum PetType { cat, dog }

mixin Pet {
  String get name;
  int get age;
  PetType get type;

  @override
  String toString() => 'Pet is $type, name = $name, age = $age';

  @override
  int get hashCode => Object.hash(name, age, type);

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Pet &&
  //         other.name == name &&
  //         other.age == age &&
  //         other.type == type;

  @override
  bool operator ==(Object other) =>
      other.hashCode ==
      hashCode; //As far as the other hashcode is equal to out hashcode, we are the same
}

class Cat with Pet {
  @override
  final int age;

  @override
  final String name;

  @override
  // PetType get type => PetType.cat;
  final PetType type;

  // Cat({required this.age, required this.name});
  Cat({required this.age, required this.name}) : type = PetType.cat;
}

//---------------------------------
//DART REFLECTIONS WITH MIXINS NOT AVAILABLE IN FLUTTER ONLY DART APPLICATION
//import dart:mirrors first

extension AsKey on VariableMirror {
  //a variablemirror is just a variable which has a name and a datatype
  String get asKey {
    final fieldName = MirrorSystem.getName(simpleName);
    final fieldType = MirrorSystem.getName(type.simpleName);

    return '$fieldName ($fieldType)';
  }
}

mixin HasDescription {
  @override
  String toString() {
    final reflection = reflect(this);
    //Returns to us the name of the type
    final thisType = MirrorSystem.getName(reflection.type.simpleName);
    //Returns to us the list of all available variables in the class
    final variables =
        reflection.type.declarations.values.whereType<VariableMirror>();

    final properties = <String, dynamic>{
      for (final field in variables)
        field.asKey: reflection.getField(field.simpleName).reflectee
    }.toString();

    return '$thisType = $properties';
  }
}

class Person with HasDescription {
  final String name;
  final int age;

  const Person({required this.name, required this.age});
}

class House with HasDescription {
  final String address;
  final int rooms;

  const House({required this.address, required this.rooms});
}
