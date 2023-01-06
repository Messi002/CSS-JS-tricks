// ignore_for_file: public_member_api_docs, sort_constructors_first
//Late variables are initialised when they are first used...

void main(List<String> args) {
  final person = Person();
  print(person.fullNames);
  print(person.fullNames);
  print(person.fullNames);
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
  // late String firstName = fullNames.split

  String _getFullNames() {
    print('Function _getFullNames is called');
    return 'Foo Baz';
  }
}
