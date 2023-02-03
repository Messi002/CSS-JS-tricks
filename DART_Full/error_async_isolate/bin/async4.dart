//handling errors in streams...

void main(List<String> args) async {
  print('-----------');
  //Method_1
  await for (var name in getNames().absorbErrorsUsingHandleError()) {
    print(name);
  }
  print('-----------');
}

extension AbsorbErrors<T> on Stream<T> {
  Stream<T> absorbErrorsUsingHandleError() => handleError((_, __) {});
}

Stream<String> getNames() async* {
  yield 'Austin';
  yield 'Gareth';
  throw 'All out of names';
}


//Method_2
//Method_3