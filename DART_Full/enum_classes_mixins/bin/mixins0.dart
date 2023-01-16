//Since Dart doesn't have multiple inheritance, the solution to this is `Mixins`
//Abstract fields on mixins means that any other mixin built on it must have that property

void main(List<String> args) {
  final person = Person();
  person.jump(speed: 10);
  person.walk(speed: 6);
  print('------------------------');
  final person1 = PersonX(firstName: 'John', lastName: 'Doe');
  print(person1.fullName);
  print('------------------------');
  final whiskers = Cat(age: 2);
  print(whiskers.age);
  whiskers.increment();
  print(whiskers.age);
}

mixin HasSpeed {
  //This is a property I can read from and write to
  abstract double speed;
}

mixin CanJump on HasSpeed {
  void jump({required double speed}) {
    print('$runtimeType is jumping at the speed of $speed');
    this.speed = speed;
  }
}

mixin CanWalk on HasSpeed {
  void walk({required double speed}) {
    print('$runtimeType is walking at the speed of $speed');
    this.speed = speed;
  }
}

class Person with HasSpeed, CanJump, CanWalk {
  @override
  double speed;

  Person() : speed = 0.0;
}

//---------------------------------------------------
//Mixins are a datatype themselves, so below we are going to work on how to accept
//a mixin in a function

// String getFullName(HasFullName obj) => obj.fullName;

mixin HasFirstName {
  String get firstName;
}

mixin HasLastName {
  String get lastName;
}

mixin HasFullName on HasFirstName, HasLastName {
  String get fullName => '$firstName $lastName';
}

class PersonX with HasFirstName, HasLastName, HasFullName {
  @override
  final String firstName;

  @override
  final String lastName;

  PersonX({required this.firstName, required this.lastName});
}

//---------------------------------------------------
//MIXINS with logic
mixin HasAge {
  //abstract used because we can read from and write to it rather if it were a getter
  //we will be able to read from it only
  abstract int age;
  void increment() => age++;
}

class Cat with HasAge {
  @override
  int age = 0;

  Cat({required this.age});
}
