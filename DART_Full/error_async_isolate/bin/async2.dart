//Future => | ----------1 sec ------------- X |
//Stream => | -------1 sec ----- X ----- 1 sec ----- X ----- 1 sec ----- X|
//To consume streams we use the `await_for` keyword
void main(List<String> args) async {
  await for (var number in getNumbers()) {
    // print(number);
  }
  print('-------------');
  await for (var character
      in getNames().asyncExpand((name) => getCharacters(name))) {
    print(character);
  }
  print('-------------');
  int sum = 0;
  await for (var number in getAllNumbers()) {
    sum += number;
  }
  print(sum);
  //Or you can use the reduce function to get the sum....
  final sum1 = getAllNumbers().reduce((a, b) => a + b);
  print('This is coming from sum2 $sum1');
  print('-------------');
}

//37: 03
Stream<int> getNumbers() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

//Async expand for every value that a stream produces, you can produce another stream...
Stream<String> getCharacters(String frmString) async* {
  for (var i = 0; i < frmString.length; i++) {
    await Future.delayed(const Duration(milliseconds: 300));
    yield frmString[i];
  }
}

Stream<String> getNames() async* {
  await Future.delayed(const Duration(milliseconds: 200));
  yield 'John';
  await Future.delayed(const Duration(milliseconds: 200));
  yield 'Doe';
}

//To add
Stream<int> getAllNumbers() async* {
  yield 10;
  yield 20;
  yield 30;
  yield 40;
  yield 50;
}
