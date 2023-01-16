//Since Dart doesn't have multiple inheritance, the solution to this is `Mixins`
//Abstract fields on mixins means that any other mixin built on it must have that property

void main(List<String> args) {}

mixin HasSpeed {
  abstract double speed;
}

mixin CanJump on HasSpeed{
  void jump({required double speed}) {
    print('$runtimeType is jumping at the speed of $speed');
    this.speed = speed;
  }
}


mixin CanWalk on CanJump{
  void jump({required double speed}) {
    print('$runtimeType is jumping at the speed of $speed');
    this.speed = speed;
  }
}