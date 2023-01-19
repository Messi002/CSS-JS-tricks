//E means element
//T means some sort of generic type

void main(List<String> args) {
  final double doubleValue = eitherIntOrDouble();
  final int intValue = eitherIntOrDouble();
  print(doubleValue);
  print(intValue);
  // final String stringValue = eitherIntOrDouble();
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
