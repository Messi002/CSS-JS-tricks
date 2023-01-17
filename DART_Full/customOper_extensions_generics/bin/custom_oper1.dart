//Custom operators are like functions in which you add functionality the way you want

void main(List<String> args) {}

class FamilyMember {
  final String name;

  FamilyMember({required this.name});

  @override
  String toString() => 'Family member (name = $name)';
}

class Family {
  final List<FamilyMember> members;

  Family({required this.members});

  @override
  String toString() => 'Family (members = $members)';
}
