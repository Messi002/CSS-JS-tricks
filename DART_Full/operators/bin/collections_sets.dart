//download the collection package for sets i.e. dart pub add collection
import 'package:collection/collection.dart';

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



  // if (ages1 == ages2) {
  //   print('Ages are equal');
  // } else {
  //   print('Ages are not equal');
  // } 

  print('===================');
//This function comes from the collection package
//even if the ordering is not the same, irrespective of the index(deep comparison)
  if (SetEquality().equals(ages1, ages2)) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  } 

}
