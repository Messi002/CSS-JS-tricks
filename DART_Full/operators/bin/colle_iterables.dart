//Iterables are lazyily evaluated... meaning they are called only when in use



void main(List<String> args) {
  const names = ['John', 'Jane', 'Jack', 'Jilli'];
  final upperCase = names.map((name) {
    print('map got called');
    return name.toUpperCase();
  });
  for (var name in upperCase.take(3)) {
    print(name);
  }
  // print('===================');

  // print('===================');

  // print('===================');
}
