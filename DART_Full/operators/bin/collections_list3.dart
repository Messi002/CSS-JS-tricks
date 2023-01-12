void main(List<String> args) {}

Iterable<String> getNames() sync* {
  print('producing Bob');
  yield 'Bob';
  print('producing Alice');
  yield 'Alice';
  print('producing John');
  yield 'John';
}
