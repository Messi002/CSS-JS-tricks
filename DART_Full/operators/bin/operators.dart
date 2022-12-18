
void main(List<String> arguments) {
  // late final int value = getValue();
  // print("We are here");
  // print("$value");
  final age1 = 64;
  final age2 = 20;
  //This is a compound operator
  print(age1 + age2 + 30);
  //This is the truncating operator which returns an int
  //rather than a double like would do a normal division
  final intDivided = age1 ~/ age2;
  print(intDivided);

 final inDivided = age1 % age2;
  print(inDivided);
  ///Unary_prefix
  var age3 = 30;

  ///This decreases the value and returns it and decreases the
  ///age3 itself
  print(--age3);

  ///Unary bitwise complement prefix operator
  print(~1);
}

// int getValue() {
//   print("being called from the function");
//   return 10;
// }

