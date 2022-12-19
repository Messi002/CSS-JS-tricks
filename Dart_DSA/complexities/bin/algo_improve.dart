void main(List<String> args) {
  final start = DateTime.now();
  int sum = betterSumFromOneTo(10000000000);
  final end = DateTime.now();
  final time = end.difference(start);
  print(start);
  print(sum);
  print(time);
}

int sumFromOneTo(int n) {
  int sum = 0;
  for (var i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}

int betterSumFromOneTo(int n) {
  return n * (n + 1) ~/ 2;
}
