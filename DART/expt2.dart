import 'dart:developer' as devtools show log;

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



void main(){

}