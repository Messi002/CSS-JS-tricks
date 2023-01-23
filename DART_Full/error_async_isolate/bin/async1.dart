//Futures are pieces of functionality that will complete their in the future
//For a normal function the execution will be stopped until the result is gotten
//For a Future function, the execution continues since and gets back to where the result is wanted only later

void main(List<String> args) async {
  print(await getName());
  print(await getAddress());
  print(await getCity());
}

Future<String> getName() async => 'John Doe';
Future<String> getAddress() => Future.value('123 Main St.');
Future<String> getPhoneNumber() =>
    Future.delayed(const Duration(seconds: 1), () => '555-555-555');
Future<String> getCity() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'New York';
}
