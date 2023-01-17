//Custom operators are like functions in which you add functionality the way you want

void main(List<String> args) {}

class FamilyMember {
  final String name;

  FamilyMember({required this.name});

  @override
  String toString() => 'Family member (name = $name)';
}
