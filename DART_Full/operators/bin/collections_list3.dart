

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
  /*******DIVE_DEEP_INTO_SPREAD_OPERATOR */
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

