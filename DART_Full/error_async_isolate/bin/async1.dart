//Futures are pieces of functionality that will complete their in the future
//For a normal function the execution will be stopped until the result is gotten
//For a Future function, the execution continues since and gets back to where the result is wanted only later

void main(List<String> args) async {
  print(await getName());
  print(await getAddress());
  print(await getCity());
  print('------------');
  try {
    print(await getFullName(firstName: 'Jone', lastName: 'Woods'));
    print(await getFullName(firstName: '', lastName: 'Woods'));
  } on FirstOrLastNameMissingException {
    print('First or Last name is missing...');
  }
  print('------------');
  // final length = await calculateLength(await getFullNames());
  // print(length);
  //OR
  final length = await getFullNames().then((value) => calculateLength(value));
  print(length);
  print('------------');
  print('------------');
}

Future<String> getName() async => 'John Doe';
Future<String> getAddress() => Future.value('123 Main St.');
Future<String> getPhoneNumber() =>
    Future.delayed(const Duration(seconds: 1), () => '555-555-555');
Future<String> getCity() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'New York';
}

//Future error handling...
Future<String> getFullName({
  required String firstName,
  required String lastName,
}) {
  if (firstName.isEmpty || lastName.isEmpty) {
    throw const FirstOrLastNameMissingException();
  } else {
    return Future.value('$firstName $lastName');
  }
}

class FirstOrLastNameMissingException implements Exception {
  const FirstOrLastNameMissingException();
}

//Future chaining... i.e. future withing a future
Future<String> getFullNames() =>
    Future.delayed(const Duration(seconds: 1), () => 'John Doe');

Future<int> calculateLength(String value) =>
    Future.delayed(const Duration(seconds: 1), () => value.length);
