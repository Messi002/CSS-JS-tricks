// void main(List<String> args) {
//   const string = '(';
// final runes = string.runes.toList();
// print(runes);
// }



  // final value = locale.map((item) => item['name'].toString());
  final value = locale.where((x) => x['locale'] == locale[2]['locale']);

  final value1 = locale[1]['name'];

  // locale.forEach((element) {
  //   if (element['name'] == value1) {
  //     //updatelocale(element['locale'])
  //     print(true);
  //   }
  //   return;
  // });

  final value2 = locale.where((element) => element['name'] == value1).toList();
  final value3 = value2.single;
  print(value3['locale']);
  // print("${value2[0]['locale']}");
}
