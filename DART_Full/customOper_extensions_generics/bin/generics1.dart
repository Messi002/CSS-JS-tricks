//E means element
//T means some sort of generic type

void main(List<String> args) {
  //Here the call site defines the type to be returned from the function
  final double doubleValue = eitherIntOrDouble();
  final int intValue = eitherIntOrDouble();
  print(doubleValue);
  print(intValue);
  // final String stringValue = eitherIntOrDouble();
  print('--------------------');
  print(doVariablesMatch(1, 2));
  print(doVariablesMatch(1, 2.2));
  print(doVariablesMatch(1, 'Foo'));
  print(doVariablesMatch('Foo', 'Bar'));
  print('--------------------');
  final momAndDad = {'mom': Person(), 'dad': Person()};
  final brotherAndSisterWithMyFish = {
    'brother': Person(),
    'sister': Person(),
    'fishy': Fish()
  };
  final allValues = [momAndDad, brotherAndSisterWithMyFish];
  describe(allValues);
  print('--------------------');
  const one = KeyValue(1, 2);
  print(one);
  print('--------------------');
  final JSON<String> json = {
    'name': 'Jone',
    'address' : '123 Main St.',
  };
  print(json);
  print('--------------------');
}

//Introduction
T eitherIntOrDouble<T extends num>() {
  switch (T) {
    case int:
      return 1 as T;
    case double:
      return 1.1 as T;
    default:
      throw Exception('Not Supported');
  }
}

//Checking the types of two variables; possible to compare two generics

//method1
// bool doVariablesMatch(Object a, Object b) => a.runtimeType == b.runtimeType;

//method2
bool doVariablesMatch<L, R>(L a, R b) => L == R;

//Type definitions which are generics also; generic type definitions
typedef BreathingThings<T extends CanBreathe> = Map<String, T>;

void describe(Iterable<BreathingThings> values) {
  for (var map in values) {
    for (var keyAndValue in map.entries) {
      print('Will call breathe on ${keyAndValue.key}');
      keyAndValue.value.breathe();
    }
  }
}

mixin CanBreathe {
  void breathe();
}

class Person with CanBreathe {
  const Person();

  @override
  void breathe() {
    print('breathing...');
  }
}

class Fish with CanBreathe {
  const Fish();

  @override
  void breathe() {
    print('breathing...');
  }
}

//Creating unconstrained generic
typedef KeyValue<K, V> = MapEntry<K, V>;

//Constraining generic
typedef JSON<T> = Map<String, T>;
