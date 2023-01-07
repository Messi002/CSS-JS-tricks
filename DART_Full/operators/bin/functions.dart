//Every function returns null if no return type specified

//named parameters enclosed in {}
//named parameters always need to have a default value or can be made nullable(optional)

void main(List<String> args) {
  // describe();
  // describe(
  //     something: null); //here the return type isn't used but null is printed
  describe(something: 'Hello, Dart!'); //here the string passed is used...
  print(performOperation(10, 20, add));
}

//An optional value having a default value
void describe({
  String? something = 'Hello, World!',
}) {
  print(something);
}

//Named required parameters can be optional but can't have default values...
//Named parameters can appear in any order...

//Positional paramters are associated with order and don't have names associated with them
//always required and cannot have defualt values
void sayGoodbyeTo(String person, String andOtherPerson) =>
    print("Goodbye to $person and $andOtherPerson, thanks for coming");

//Optional positional parameters and if default values are needed then [] are
//needed
void makeUpperCase([
  String? name, //This is an optional optional paramter
  String lastName = 'Baz',
]) {
  print(name?.toUpperCase());
  print(lastName.toUpperCase());
}

//Matching different styles
void describeFully(String firstName, {String? lastName = 'Bar'}) =>
    print('Hello $firstName $lastName');

//Arrow symbol
int minus([int a = 3, int b = 1]) => a - b;
int add([int a = 3, int b = 1]) => a + b;

// A Function being a first class citizen means it can be passed to other
// functions. Any thing that is describeable as a data type can be passed to a
//function
int performOperation(int a, int b, int Function(int, int) operation) =>
    operation(a, b);
