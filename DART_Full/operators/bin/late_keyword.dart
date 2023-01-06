// ignore_for_file: public_member_api_docs, sort_constructors_first
//Late variables are initialised when they are first used...

void main(List<String> args) {
  // final person = Person();
  // print(person.fullNames);
  // print(person.fullNames);

  final woof = Dog();
  woof.description = 'Description 1';
  print(woof.description);
  //Can't be assigned again application will crash...
  // woof.description = 'Description 2';
  // print(woof.description);
}

//Even values in Classes are initialized only when
//in use
// class Person {
//   late String description = heavyCalculation();
//   final int age;
//   Person({
//     this.age = 18,
//   }) {
//     print('Constructor is called');
//   }

//   String heavyCalculation() {
//     print('Function heavyCalculation is called');
//     return 'Foo Baz';
//   }
// }

///Chaining late variables
class Person {
  late String fullNames = _getFullNames();
  late String firstName = fullNames.split(' ').first;
  late String lastName = fullNames.split(' ').last;

  String _getFullNames() {
    print('Function _getFullNames is called');
    return 'Foo Baz';
  }
}

///Late keyword with the final keyword
class Dog {
  //late final variables can't be assigned twice
  late final String description;
}

///late variables depend on late final variables
class Person1 {
  late final String firstName;
  late final String lastName;
  late String fullNames = '$firstName $lastName';
}
