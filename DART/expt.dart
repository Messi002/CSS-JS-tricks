void main() {
  List productType = [
    {'product_type': 'Ohrring', 'colour': 'silberfarben'},
    {'product_type': 'Anhänger', 'colour': 'Blau'},
  ];
  List? userPref = ['Anhänger', 'Rosatd'];

  List colorType = [
    {'product_type': 'Anhänger', 'colour': 'silberfarben'},
    {'product_type': 'Rosa', 'colour': 'silberfarben'},
    {'product_type': 'Rosatd', 'colour': 'Blau'},
    {'product_type': 'Ohrring', 'colour': 'goldfarben'}
  ];

  List filtered = colorType.where((item) => item == item).toList();

  int pdtLen = userPref.length;

  switch (pdtLen) {
    case 1:
      print('number $pdtLen here');
      break;
    case 2:
      print('number $pdtLen here');

      break;
    case 3:
      print('number $pdtLen here');

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

  // for (int i = 0; i < colorType.length; i++){
  //   print('$i');
  //   if(colorType[i]['colour'] == userPref[i] || colorType[i]['colour'] == userPref[i+1]){

  //     gottenProducts.add(colorType[i]);
  //   }
  // }

  // print("${gottenProducts.toList()}");
}
