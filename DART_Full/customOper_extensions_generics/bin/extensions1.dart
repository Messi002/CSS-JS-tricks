void main(List<String> args) {
  print(30.timesFour);
  print("----------------------");
  String value = 'Hello'.reversed;
  print(value);
  print("----------------------");
  final value1 = [1, 2, 3].sum;
  final value2 = [9.1, 2.5, 3.4].sum;
  print(value1);
  print(value2);
  print("----------------------");

  final value4 = [
    for (var i = 0; i < 10; i++) i,
  ];

  for (var i = 0; i < 10; i++) {}
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
  T get sum => reduce((a, b) => a + b as T);
}

//For creating ranges in Dart like so 1.to(10) -> Iterable [1,2,3,4,5,6,7,8,9,10];
extension on int {
  Iterable<int> to(int end, {bool inclusive = true}) => end > this
      ? [for (var i = this; i < end; i++) i, if (inclusive) end]
      : [for (var i = this; i > end; i--) i, if (inclusive) end];
}
