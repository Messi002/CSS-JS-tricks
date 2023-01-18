void main(List<String> args) {
  print(30.timesFour);
  print("----------------------");
  String value = 'Hello'.reversed;
  print(value);
  print("----------------------");
  final value1 = [1, 2, 3].sum;
  final value2 = [1.1, 2.2, 3.4].sum;
  print(value1);
  print(value2);
  print("----------------------");
}

//Introduction...
extension on int {
  int get timesFour => this * 4;
}

//To reverse a string
extension on String {
  String get reversed => split('').reversed.join('');
}

//For summing an iterable
extension SumOfIterables<T extends num> on Iterable<T> {
  T get sum => fold(0 as T, (a, b) => a + b as T);
  // T get sum => reduce((a, b) => a + b as T);
}
