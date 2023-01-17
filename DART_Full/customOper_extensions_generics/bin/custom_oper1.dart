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

//--------------------------
//An operator between two optionals
//The reason why shadowing is done on optional extensions is that
//Dart has this something called type promotion meaning that if you say if(this != null)
//doesn't understand that so well

extension NullableAdd<T extends num> on T? {
  T operator +(T? other) {
    final thisShadow = this;
    if (thisShadow != null && other == null) {
      return thisShadow;
    } else if (thisShadow == null && other != null) {
      return other;
    } else if (thisShadow == null && other == null) {
      return 0 as T;
    } else {
      return thisShadow + other as T;
    }
  }
}
