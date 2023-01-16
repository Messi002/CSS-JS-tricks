//Limiting mixins to particular datatypes only

void main(List<String> args) {
  //To access it, we do it this way
  Human().run();
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
  bool operator ==(Object other) => other.hashCode == hashCode; //As far as the other hashcode is equal to out hashcode, we are the same
}
