void main(List<String> args) {
  print('Foo Bar' - 'Bar');
  print('Bar' - 'Bar');
  print('Foo Bar' - 'Baz');
  print('----------------------');
  final sum = [1, 2, 3] - [3];
  print(sum);
}

extension Remove on String {
  String operator -(String other) => replaceAll(other, '');
}

extension RemoveIterable<T> on Iterable<T> {
  Iterable<T> operator -(Iterable<T> other) =>
      where((element) => other.contains(element));
}
