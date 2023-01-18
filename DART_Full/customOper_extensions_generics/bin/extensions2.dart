import 'dart:math' show Random;

void main(List<String> args) {
  print(add.callWithRandomValues());
  print(subtract.callWithRandomValues());
  print('-----------------------');
}

//Extensions on typedef
//Typedef means that we are actually creating our own data type like int, double, String and so on...
//on which we can then use extension on our own created data type

typedef IntFunction = int Function(int, int);

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;

extension on IntFunction {
  int callWithRandomValues() {
    final rnd1 = Random().nextInt(100);
    final rnd2 = Random().nextInt(100);
//Call is something Dart uses to allow you call a function without its name
    return call(rnd1, rnd2);
  }
}
