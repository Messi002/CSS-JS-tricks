//enumerations allow you to create similar objects in one sturcture

import 'dart:html';

void main(List<String> args) {
  final woof = Animal(name: 'Woof', type: AnimalType.dog);

  //************Comparison of enums */
  if (woof.type == AnimalType.cat) {
    print('woof is a cat');
  } else {
    print('woof is not a cat');
  }

  //*****************Switching on enums */
}

enum AnimalType {
  rabbit,
  cat,
  dog,
}

class Animal {
  final String name;
  final AnimalType type;

  Animal({required this.name, required this.type});
}
