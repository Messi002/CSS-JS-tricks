//Future => | ----------1 sec ------------- X |
//Stream => | -------1 sec ----- X ----- 1 sec ----- X ----- 1 sec ----- X|
//To consume streams we use the `await_for` keyword
void main(List<String> args) async {
  await for (var number in getNumbers()) {
    print(number);
  }
}

Stream<int> getNumbers() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
