//SET_COMPREHENSION
//A string is given, now extract all the characters that are not equal to a,b,c

void main(List<String> args) {
  final String name = 'abracadabra';
  print(name.split(''));
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

  print('-------------------------');

  final allNumbers = Iterable.generate(100);
  final evenNumbers = [
    for (final number in allNumbers)
      {
        if (number % 2 == 0) {number}
      }
  ];

  print(evenNumbers);
  //if it was to be done using a functional way then we need the
  //where function i.e.
  final evenNumbersFunctional = allNumbers.where((number) => number % 2 == 0);
}
//1:46:26
