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

class Email {
  String _add = '';

  String get value => _add;
  set value(String addre) => _add = addre;
}

void main() {
  final email = Email();
  email.value = 'rostandmessi2@gmail.com';
  
}
