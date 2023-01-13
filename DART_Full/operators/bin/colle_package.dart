//This is only for the collection package study in-deepth...
import 'package:collection/collection.dart';

void main(List<String> args) {
  // testBoolList();
  testCanonicalizedMap();
}

//This is used when working with so many booleans
void testBoolList() {
  final boolList = BoolList(10, growable: true);
  print(boolList);
  //Then any value at a specified index can be modified
  boolList[3] = true;
  print(boolList);
}

//Canonicalized-map
void testCanonicalizedMap() {
  final info = {
    'name': 'John',
    'age': 30,
    'sex': 'male',
    'address': 'New York',
  };

  final canonMap = CanonicalizedMap.from(info, (key) {
   return key.length;
  });
  //If a key is freshly added to the canonMap map then it overrides any other 
  //key with which it shares the same length
  print(canonMap);
}
