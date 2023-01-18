import 'dart:math' show Random;

void main(List<String> args) {
  print(add.callWithRandomValues());
  print(subtract.callWithRandomValues());
  print('-----------------------');
  const jack = Person(name: 'Jack Dowe', age: 28);
  print(ShortDescription(jack).description);
  print('-----------------------');
}

//Extensions on typedef
//Typedef means that we are actually creating our own data type like int, double, String and so on...
//on which we can then use extension on our own created data type

typedef IntFunction = int Function(int, int);

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;

extension on IntFunction {
  int callWithRandomValues() {
    final rnd1 = Random().nextInt(100);
    final rnd2 = Random().nextInt(100);
//Call is something Dart uses to allow you call a function without its name
    //return this.call(rnd1, rnd2); or this other method....
    return call(
      rnd1,
      rnd2,
    );
  }
}

//Why some extensions have name others don't?
//When two extensions haven't been given a name and we don't know 
//how to call it or go about it

class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});
}

//Short description
extension ShortDescription on Person {
  String get description => '$name ($age)';
}

//long description
extension LongDescription on Person {
  String get description => '$name is $age old';
}
