import 'dart:convert';
import 'dart:io';
import 'dart:developer' as devtools show log;

import 'package:meta/meta.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

// void main() {
//   List<String> colours = ['silberfarben', 'Blau', 'goldfarben'];
//   List<String> product = ['Anhänger', 'Ohrring', 'Rosa'];
//   List<String> price = ['3000'];

//   String AND(List<String> queries) {
//     return queries.join(" AND ");
//   }

//   String castToQueryList<T>(List<T> data, String Function(T data) getValue) {
//     final List<String> idStrings = data.map(getValue).toList();
//     print('This is from idStrings ${idStrings.join('", "')}');
//     return '{"${idStrings.join('", "')}"}';
//   }

//   final String colorQueryList = castToQueryList<String>(colours, (e) => e);
//   final String typeQueryList = castToQueryList<String>(product, (e) => e);
//   final String priceQueryList = castToQueryList<String>(price, (e) => e);

//   final total = AND([colorQueryList, typeQueryList, priceQueryList]);

//   print("$colorQueryList");
//   print("$typeQueryList");
//   print("This is the value from total: $total");
//   print("This is the runtimeType from total: ${total.runtimeType}");
//   print("${colorQueryList.runtimeType}");

// }

// void main() {
//   List<Map> color = [{'id': 'gold', 'label':'gold'},{'id': 'red', 'label':'red'},{'id': 'green', 'label':'green'},{'id': 'yellow', 'label':'yellow'}];

//   List<Map> listed =
//       color.where((element) => element['id'] == 'gold' || element['id'] == 'yellow').toList();

//   print("${listed}");
// }

extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) =>
      HttpClient().getUrl(Uri.parse(url)).then((req) => req.close());
}

mixin CanMakeGetCall {
  String get url;

  @useResult
  Future<String> getString() =>
      getUrl(url).then((res) => res.transform(utf8.decoder).join());
}

@immutable
class GetPeople with CanMakeGetCall {
  const GetPeople();

  @override
  String get url => 'http://127.0.0.1:5500/person.json';
}

mixin CanRun on Animal {
  int get speed;

  void run() {
    'Running at the speed of $speed'.log();
    print('Running at the speed of $speed');
  }
}

class Animal {
  const Animal();
}

class Cat extends Animal with CanRun {
  @override
  int speed = 10;
}

void testIt() async {
  // final cat = Cat();
  // cat.run();
  // cat.speed = 20;
  // cat.run();
  final people = await const GetPeople().getString();
  people.log();
  print(people.toString());
}

void main() {
  testIt();
  print('main function being executed...');
}
