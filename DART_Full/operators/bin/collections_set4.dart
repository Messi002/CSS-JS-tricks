
//SET_COMPREHENSION
//A string is given, now extract all the characters that are not equal to a,b,c 

void main(List<String> args) {
  final String name = 'abracadabra';
  var result1 = '';
  //first way of doing it
  for (final char in name.split('')) {
    if (char == 'a' || char == 'b' || char == 'c') {
    } else {
      result1 += char;
    }
  }
  print(result1);

  var result = {
    for (final char in name.split('')) 'abc'.contains(char) ? null : char
  }
    ..removeAll([null])
    ..cast<String>();

  print(result);
}
