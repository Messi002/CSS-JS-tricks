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
}
