//Custom operators are like functions in which you add functionality the way you want
//Sync generators return an Iterable
//Async generators return a Stream

void main(List<String> args) {
  final dad = FamilyMember(name: 'dad');
  final mom = FamilyMember(name: 'mom');

  final fam = dad + mom;
  print(fam);
  print('----------------');
  const names = ['Seth', 'Kathy', 'Ethan', 'Megan'];
  print(names * 2);
}

class FamilyMember {
  final String name;

  const FamilyMember({required this.name});

  @override
  String toString() => 'Family member (name = $name)';
}

class Family {
  final List<FamilyMember> members;

  const Family({required this.members});

  @override
  String toString() => 'Family (members = $members)';
}

extension ToFamily on FamilyMember {
  Family operator +(FamilyMember other) => Family(members: [this, other]);
}

//-------------------------------------
extension Times<T> on Iterable<T> {
  Iterable<T> operator *(int times) sync* {
    for (var i = 0; i < times; i++) {
      yield* this;
    }
  }
}
