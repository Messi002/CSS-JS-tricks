//Limiting mixins to particular datatypes only

void main(List<String> args) {
  //To access it, we do it this way
  Human().run();
}

//With this we can't call the `with CanRun` on the class below
//because the mixin says I'm only available on any class that extends Has2Feet
class Has2Feet {
  const Has2Feet();
}

mixin CanRun on Has2Feet {
  void run() {
    print('$runtimeType is running...');
  }
}

class Human extends Has2Feet with CanRun {
  const Human();
}
