import 'package:operators/operators.dart' as operators;

void main(List<String> arguments) {
  late final value = getValue();
  print("We are here");
  print("$value");
}

int getValue() {
  print("being called from the function");
  return 10;
}
