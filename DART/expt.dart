void main(){


  List productType = [
    {'product_type': 'Ohrring', 'colour': 'silberfarben'},
     {'product_type': 'Anhänger', 'colour': 'Blau'},
  ];
List userPref = ['silberfarben','Blau'];
  
  List colorType = [
    {'product_type': 'Anhänger', 'colour': 'silberfarben'},
    {'product_type': 'Rosa', 'colour': 'silberfarben'},
    {'product_type': 'Rosatd', 'colour': 'Blau'},
    {'product_type': 'Ohrring', 'colour': 'goldfarben'}
  ];
  
  List filtered = colorType.where((item)=> item == item).toList();
  
var gottenProducts = colorType.where((element) {
  return element['colour'] == userPref[0] || element['colour'] == userPref[1];
});
   
  // for (int i = 0; i < colorType.length; i++){
  //   print('$i');
  //   if(colorType[i]['colour'] == userPref[i] || colorType[i]['colour'] == userPref[i+1]){
      
  //     gottenProducts.add(colorType[i]);
  //   }
  // }










  print("${gottenProducts.toList()}");
  
 
}