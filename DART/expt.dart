void main() {
  // List productType = [
  //   {'product_type': 'Ohrring', 'colour': 'silberfarben'},
  //   {'product_type': 'Anhänger', 'colour': 'Blau'},
  // ];
  //user pref from db
  List? userPref = [
    'Anhänger','Ohrring'
    //  'Rosatd'
  ];

  List colorType = [
    {'product_type': 'Anhänger', 'colour': 'silberfarben'},
    {'product_type': 'Rosa', 'colour': 'silberfarben'},
    {'product_type': 'Rosatd', 'colour': 'Blau'},
    {'product_type': 'Ohrring', 'colour': 'goldfarben'}
  ];

  // List filtered = colorType.where((item) => item == item).toList();



  // print("${colorType[0]['colour']}");
  int pdtLen = userPref.length;
  var fetp;

  switch (pdtLen) {
    case 1:
      // final got = colorType.where((elt) => elt['product_type'])
      var fet = colorType
          .where((element) => element['product_type'] == userPref[0])
          .toList();
      fetp = fet;

      break;
    case 2:
        var fet = colorType
          .where((element) => element['product_type'] == userPref[0] || element['product_type'] == userPref[1])
          .toList();
      fetp = fet;
      break;
    case 3:
      var fet = colorType
          .where((element) => element['product_type'] == userPref[0] || element['product_type'] == userPref[1] || element['product_type'] == userPref[2])
          .toList();
      fetp = fet;

      break;
    case 4:
      print('number $pdtLen here');

      break;
    case 5:
      print('number $pdtLen here');

      break;
    case 6:
      print('number $pdtLen here');

      break;
    default:
      print('null list');
  }

  print("${fetp}");
  // for (int i = 0; i < colorType.length; i++){
  //   print('$i');
  //   if(colorType[i]['colour'] == userPref[i] || colorType[i]['colour'] == userPref[i+1]){

  //     gottenProducts.add(colorType[i]);
  //   }
  // }

  // print("${gottenProducts.toList()}");




}
