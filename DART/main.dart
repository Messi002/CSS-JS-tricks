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

Stream<int> boatSending() async* {
  for (var i = 0; i < 10; i++) {
    print('Boat $i sent...');
    await Future.delayed(Duration(seconds: 3));
    yield i;
  }
}

void main(List<String> args) {
  Stream stream = boatSending();

  stream.listen((event) {
    print('Boot $event received...');
  });
}