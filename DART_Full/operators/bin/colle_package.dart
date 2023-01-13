//This is only for the collection package study in-deepth...
import 'package:collection/collection.dart';

void main(List<String> args) {
  // testBoolList();
  // testCanonicalizedMap();
  testCombinedIterableView();
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
//It is useful when you wish to create your own maps and
//define the parameters for the keys, not necessarily having
//thesame hashcode, and compared using equality operator
void testCanonicalizedMap() {
  final info = {
    'name': 'John',
    'age': 30,
    'sex': 'male',
    'address': 'New York',
  };

  final canonMap = CanonicalizedMap.from(info, (key) {
    //return key.split('').first;
    return key.length;
  });
  //If a key is freshly added to the canonMap map then it overrides any other
  //key with which it shares the same length
  print(canonMap);
}

void testCombinedIterableView() {
  //This is like combining all the iterables into one
  final Iterable<int> one = [1, 2, 3];
  final List<int> two = [10, 20, 30];
  final Iterable<int> three = [40, 50, 60];

  var combined = CombinedIterableView([
    one,
    two,
    three,
  ]);
  two.add(50);
  print(combined);
}

//Combinedlistview is a view of a list of lists and it is unmodifiable
void testCombinedListView() {}

void testMergedMap() {
  final info1 = {
    'name': 'John 1',
    'age': 30,
    'sex': 'male',
  };

  final info2 = {
    'name': 'John 2',
    'age': 31,
    'sex': 'male',
    'address': 'New York',
  };
//Used to combine two maps together...
  final mergedMap = mergeMaps(info1, info2);
  //if the two dictionaries have the same value then we can provide a logical for selecting the values 
  //of the first, since by default it selects the values of the second dictonaries...

  //like so:   final mergedMap = mergeMaps(info1, info2, value:(one, two) => one);
}
