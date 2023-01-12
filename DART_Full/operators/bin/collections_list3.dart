// void main(List<String> args) {
//   for (var name in getNames()) {
//     print(name);
//   }
// }

// Iterable<String> getNames() sync* {
//   print('producing Bob');
//   yield 'Bob';
//   print('producing Alice');
//   yield 'Alice';
//   print('producing John');
//   yield 'John';
//   print('producing template_names');
//   //the yield with an asterik(*) is used for injecting another
//   //return value into already a synchronous code
//   yield* templateNames();
// }

// Iterable<String> templateNames() sync* {
//   print('producing Foo');
//   yield 'Foo';
//   print('producing Bar');
//   yield 'Bar';
//   print('producing Baz');
//   yield 'Baz';
// }

//**************************************** */

void main(List<String> args) {
  addToArrayRight();
}

void addToArrayWrong() {
  final names1 = ['Foo1', 'Bar1', 'Baz1'];
  final names2 = ['Foo2', 'Bar2', 'Baz2'];

//This is wrong because you aren't copying the content of names1 but rather
//assignin it to allNamesWrong reason why it is altered
  final allNamesWrong = names1;
  allNamesWrong.addAll(names2);

  print(names1);
  print(names2);
  print(allNamesWrong);
}

void addToArrayRight() {
  final names1 = ['Foo1', 'Bar1', 'Baz1'];
  final names2 = ['Foo2', 'Bar2', 'Baz2'];

//This is wrong because you aren't copying the content of names1 but rather
//assignin it to allNamesWrong reason why it is altered
  final allNamesRight = [...names1, ...names2]; //list, sets and maps as well
  //or another way could be
  final allNamesRightAnotherWay = [...names1]..addAll(names2);

  print(names1);
  print(names2);
  print(allNamesRight);
}

//if a map is made const which of occurs means that nothing new can't be added to it
//that can be changed by using a spread operator and then ..addAll()