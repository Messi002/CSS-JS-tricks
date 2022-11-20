import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

// enum Weather {
//   sunny,
//   cloudy,
//   rainy,
//   windy,
// }

// void main(List<String> args) {
//   print('Weather Conditions');
//   print(Weather.cloudy.index);

//   const weather = Weather.rainy;

//   switch (weather) {
//     case Weather.cloudy:
//       print('It is cloudy today');
//       break;
//     case Weather.rainy:
//       print('It is rainy today');
//       break;
//     case Weather.sunny:
//       print('It is sunny today');
//       break;
//     case Weather.windy:
//       print('Leave out the umbrella');


// Stream<int> boatSending() async* {
//   for (var i = 1 ; i < 11; i++) {
//     print('Boat $i sent...');
//     await Future.delayed(Duration(seconds: 3));
//     yield i;
//   }
// }

// void main(List<String> args) async{
//   Stream stream = boatSending();

//   stream.listen((event) {
//     print('Boot $event received...');
//   });
// }

// class User {
//   User(int id, String name) {
//     this.id: id
//    this.name:name
//   }
//   int id = 0;
//   String name = '';
// }

// void main(List<String> args) {
// final user = User()
// ..name = 'Austin'
// ..id = 0;

// print(user.id);
// }

// class Email {
//   String _add = '';

//   String get value => _add;
//   set value(String addre) => _add = addre;
// }

// void main() {
//   final email = Email();
//   email.value = 'rostandmessi2@gmail.com';
//   print(email.value);
// }

// void main() {
// var steaks = <String>[];

// steaks.add('cookies');
// steaks.add('cupcakes');
// steaks.add('donuts');
// steaks.add('pie');
// steaks.forEach((element) {
//   print(element);
// });

// const patries = ['cookies', 'croissant'];
// const candy = ['Junior mintss', "twizzlers"];
// List? names;

// List? deserts = ['yes or no', ...candy, ...patries, ...?names];

// deserts.forEach(print);

//   final Set setA = {1, 2, 3, 4, 5, 6, 7, 8};
//   final Set setB = {2, 3, 5, 6, 10};

//   final Set setC = setA.intersection(setB);

//   setB.remove(5);
//   print(setB);

// final Map Num = {'1': 'One', '2': 'Two', '3': 'Three'};

// print(Num[4] ?? Num);
// Num.forEach((key, value) {
//   print('$key -> $value');
// });

// List fig = [1, 2, 3, 4, 5, 6, 7];
// final squares = fig.map((e) => e * 2);
// print(squares);
// print(squares.toList());
// }
/*********/
///Array methods: .first, .last, .add, .remove, .indexOf.
///use isEmpty not isNotEmpty
///
extension on ProgrammingLanguages {
  bool get IsStronglyType {
    switch (this) {
      case ProgrammingLanguages.dart:
      case ProgrammingLanguages.swift:
        return true;
      case ProgrammingLanguages.javascript:
        return false;
      default:
        throw ArgumentError('Invalid language', 'Language not accepted');
    }
  }
}

extension on String {
  String get encoded {
    return _code(4);
  }

  String get decoded {
    return _code(-4);
  }

  String _code(int step) {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + step);
    }
    return output.toString();
  }
}

class Calculator with Adder {}

mixin Adder {
  add(a, b) {
    print('${a + b}');
  }
}

String EncodedString(String input) {
  final output = StringBuffer();
  for (final codePoint in input.runes) {
    output.writeCharCode(codePoint + 1);
  }
  return output.toString();
}

enum ProgrammingLanguages {
  dart,
  swift,
  javascript,
}

// void main(List<String> args) {
//   Calculator calc = Calculator();

//   calc.add(2, 3);
// final original = 'ghi';
// final secret = EncodedString(original);
// print("$secret");

// final secret = 'I like extensions!'.encoded;
// print('$secret');
// print(secret.decoded);

// final language = ProgrammingLanguages.javascript;
// print(language.IsStronglyType);

//   print('Before future');
//   final futureNum = Future<int>.delayed(Duration(seconds: 10), () => 48).
//   then((value) => print(value))
//   .catchError((error) => print(error))
//   .whenComplete(() => print('Future completed'));
//   print('After future');

// }

// Future<void> main() async {
//   final file = File('assets/text.txt');
//   final contents = await file.readAsString();
//   print(contents);
// }

// Future<void> main() async {
//   final file = File('assets/text.txt');
//   final stream = file.openRead();
//   // stream.listen((event) {
//   //   print(event.length);
//   // });
//   await for (var data in stream.transform(utf8.decoder)) {
//     print(data);
//   }
// }

void playHide(SendPort sendPort) {
  var counting = 0;
  for (var i = 0; i < 1000000000; i++) {
    counting = i;
  }
  sendPort.send('$counting! Ready or not Here I come... :)');
}

Future<void> main() async {
  ReceivePort receivePort = ReceivePort();

  final createdIsolate = await Isolate.spawn(playHide, receivePort.sendPort);

  receivePort.listen((message) {
    print(message);
    receivePort.close();
    createdIsolate.kill();
  });
}



// https://discord.com/invite/R5QsRJUkT8