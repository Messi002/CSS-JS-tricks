//download the collection package for sets i.e. dart pub add collection
// import 'package:collection/collection.dart';

void main(List<String> args) {
  final names = {
    'Foo',
    'Bar',
    'Baz',
    'Qux',
  };
  // print('===================');
  final names2 = [
    'Foo',
    'Bar',
    'Foo',
    'Baz',
    'Qux',
    'Baz',
  ];

  final uniqueNames = {...names2}; //This is the spread_operator
  print(uniqueNames);

  print('===================');
  final ages1 = {20, 30, 40};
  final ages2 = {20, 30, 40};

  if (ages1 == ages2) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  } //42"32

  // print('===================');

  // print('===================');

  // print('===================');

  // print('===================');

  // print('===================');
}
