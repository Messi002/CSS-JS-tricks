// ignore_for_file: public_member_api_docs, sort_constructors_first
//Late variables are initialised when they are first used...

void main(List<String> args) {}

class Person {
  final int age;
  Person({
    this.age = 18,
  }) {
    print('Constructor is called');
  }

  String heavyCalculation() {
    print('Function heavyCalculation is called');
    return 'Foo Baz';
  }
}
