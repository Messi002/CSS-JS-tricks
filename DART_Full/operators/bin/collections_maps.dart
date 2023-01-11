void main(List<String> args) {
  final info = {
    'name': 'John',
    'age': 30,
    // 'height': 1.8,
    // 'isMarried': false,
    // 'address': {
    //   'street': 'main street',
    //   'city': 'Yaounde',
    //   'country': 'Cameroon'
    // }
  };

  // print(info);
  print(info.keys);
  print(info.values);
  //The below functionality will add if and only if height isn't present
  info.putIfAbsent('height', () => 180);
  print(info);
  //The below code adds and overrides height if already present
  info['height'] = 190;
  print(info);
  print('===================');
  if (info.containsKey('height')) {
    print('Height is ${info['height']}');
  } else {
    print('Height not found');
  }
//If you try to retrieve the value of a key which isn't present it will return null
//not crash actually
 
}
