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
}

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

//Checking the types of two variables

//method1
// bool doVariablesMatch(Object a, Object b) => a.runtimeType == b.runtimeType;

//method2
bool doVariablesMatch<L, R>(L a, R b) => L == R;
