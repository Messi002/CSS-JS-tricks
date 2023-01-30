//Control flow statements are used to change the flow of the application
//E.g. if, else ifs,

import 'dart:io';

void main(List<String> args) {
  // final names = ['Paul, "Geroge', "Easy"];
  // int counter = 0;
  // for (var number in Iterable.generate(10)) {
  //   print(number);
  // }

  //while loop
  // while (counter < names.length) {
  //   print(names);
  //   counter++;
  // }
  // or
  // int countera = -1;
  // while (++countera < names.length) {}

//D0-While executes first the body before checking on the condition
  // do {
  //   print(names[counter++]);
  // } while (counter < names.length);

  //looping over maps since dart doesn't have tuples
  // const info = {
  //   'name': 'John',
  //   'age': 30,
  //   'height': 1.8,
  //   'isMarried': false,
  //   'address': {
  //     'street': 'main street',
  //     'city': 'Yaounde',
  //     'country': 'Cameroon'
  //   }
  // };

  // for (var entry in info.entries) {
  //   print('${entry.key} : ${entry.value}');
  // }

  //Mixing all what has been taught
  do {
    stdout.write('Enter your age or type "exit": ');
    final input = stdin.readLineSync();

    if (input == 'exit') {
      break;
    } else if ((input?.length ?? 0) == 0 || input == null) {
      stdout.writeln('Invalid age! Please Try Again...');
      continue;
    }

    final age = int.tryParse(input);

    if (age == null) {
      stdout.writeln('Invalid age! Please Try Again...');
      continue;
    }

    switch (age) {
      case 10:
        stdout.writeln('You are 10 years old...');
        break;
      case 15:
        stdout.writeln('You are young... super');
        break;
      default:
        stdout.writeln('You are $age years old, isn\'t that awesome, sure it is...');
    }
  } while (true);
}

//While loop evaluates just the condition and if that condition is met, then the
//loop is exited i.e. it evaluates first the condition then executes its body
//While can be read "as long as"

//Switch cases

void describe<T>(T value) {
  switch (T) {
  }
}
