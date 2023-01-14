//enumerations allow you to create similar objects in one sturcture


void main(List<String> args) {
  final woof = Animal(name: 'Woof', type: AnimalType.dog);

  //************Comparison of enums */
  if (woof.type == AnimalType.cat) {
    print('woof is a cat');
  } else {
    print('woof is not a cat');
  }

  //*****************Switching on enums */
//It is advisable to use switch statements because when a new enum is added our switch
//statement will break while our if statement won't and breaking is actually good because
//it tells us something hasn't been handled yet.
  switch (woof.type) {
    case AnimalType.rabbit:
      print('This is a rabbit');
      break;
    case AnimalType.cat:
      print('This is a cat');
      break;
    case AnimalType.dog:
      print('This is a dog');
      break;
  }
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
