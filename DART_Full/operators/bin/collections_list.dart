void main(List<String> args) {
  final names = ['Foo', 'Bar', 'Baz', 'Qux'];

  for (var name in names) {
    print(name);
  }

  print('===================');

  for (var name in names.reversed) {
    print(name);
  }

  print('===================');
  if (names.contains('Bar')) {
    print('Bar is in the list');
  }

  print('===================');
  for (var name in names.where((value) => value.startsWith('B'))) {
    print(name);
  }

  print('===================');
  //List are collections and are zero-based i.e. first item has the index of zero
  print(names[0]);
  print(names[1]);
  print('===================');
  //sublist
  names.sublist(1).forEach(print);

  print('===================');
  names.map((str) => str.toUpperCase()).forEach(print);

  print('===================');
  final numbers = [1, 2, 3, 4, 5];
  final sum =
      numbers.fold(0, (previousValue, thisValue) => previousValue + thisValue);
  print(sum);

  final result = names.fold(
      '', (previousValue, str) => '$previousValue ${str.toUpperCase()}');
  print(result);


}
