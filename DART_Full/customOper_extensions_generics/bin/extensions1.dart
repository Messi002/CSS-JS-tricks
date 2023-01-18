void main(List<String> args) {
  print(30.timesFour);
  print("----------------------");
  String value = 'Hello'.reversed;
  print(value);
}

//Introduction...
extension on int {
  int get timesFour => this * 4;
}

//To reverse a string
extension on String {
  String get reversed => split('').reversed.join('');
}
