enum AnimalType1 {
  rabbit,
  cat,
  dog;

  void run() {
    print('running...');
  }
}

void main(List<String> args) {
  //***************ENUMS_AND_MIXINS */
  AnimalType.cat.jump();
  AnimalType.dog.jump();
  try {
    AnimalType.fish.jump();
  } catch (e) {
    print(e);
  }
  print('-----------');
  AnimalType1.cat
    ..jump()
    ..run();
}

mixin canJump {
  int get feetCount;

  void jump() {
    if (feetCount < 1) {
      throw Exception('Cannot jump!');
    } else {
      print('Jumped!');
    }
  }
}

enum AnimalType with canJump {
  cat(feetCount: 4),
  dog(feetCount: 4),
  fish(feetCount: 0);

  @override
  final int feetCount;

  const AnimalType({required this.feetCount});
}

//***********ENUMS_WITH_FUNCTIONS_INSIDE_AS_WELL_AS_OUTSIDE */
//When adding a function inside an enum, make sure that the last value before the enum
//ends with a semi-colon (;)

//**********USING_EXTENSIONS_ON_ENUMS */
extension Jump on AnimalType1 {
  void jump() => print('$this is jumping...');
}

//*******************ENUMS_COMPARISON */
class TeslaCars {
  final double weightInKg;

  const TeslaCars({required this.weightInKg});
}
