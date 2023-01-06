//Every function returns null if no return type specified

//named parameters enclosed in {}
//named parameters always need to have a default value or can be made nullable(optional)

void main(List<String> args) {
  describe();
  describe(something: null); //here the return type isn't used but null is printed
  describe(something: 'Hello, Dart!');//here the string passed is used...
}

//An optional value having a default value
void describe({
  String? something = 'Hello, World!',
}) {
  print(something);
}
