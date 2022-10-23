// import 'dart:io';

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
//       break;
//     default:
//       print('Strange, really strange');
//   }

//   User user = User();
//   print(user);
// }

// class User {
//   final name = 'Ram';
//   final id = 0;

//   @override
//   String toString() {
//     return '{"name": "$name", "id": $id}';
//   }
// }

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

void main() {
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

  List fig = [1, 2, 3, 4, 5, 6, 7];
  final squares = fig.map((e) => e * 2);
  print(squares);
  print(squares.toList());
}
/*********/
///Array methods: .first, .last, .add, .remove, .indexOf.
///use isEmpty not isNotEmpty