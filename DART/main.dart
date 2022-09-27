import 'dart:io';

enum Weather {
  sunny,
  cloudy,
  rainy,
  windy,
}

void main(List<String> args) {
  print('Weather Conditions');
  print(Weather.cloudy.index);

  const weather = Weather.rainy;

  switch (weather) {
    case Weather.cloudy:
      print('It is cloudy today');
      break;
    case Weather.rainy:
      print('It is rainy today');
      break;
    case Weather.sunny:
      print('It is sunny today');
      break;
    case Weather.windy:
      print('Leave out the umbrella');
      break;
    default:
      print('Strange, really strange');
  }

  User user = User();
  print(user);
}

class User {
  final name = 'Ram';
  final id = 0;
}
