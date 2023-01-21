const json = {'name': 'Mark', 'age': 40};

void main(List<String> args) {
  print(30.timesFour);
  print("----------------------");
  String value = 'Hello'.reversed;
  print(value);
  print("----------------------");
  final value1 = [1, 2, 3].sum;
  final value2 = [9.1, 2.5, 3.4].sum;
  print(value1);
  print(value2);
  print("----------------------");
  print(1.to(10));
  print(1.to(10, inclusive: false));
  print(10.to(1));
  print(10.to(1, inclusive: false));
  print("----------------------");
  print([1, 2, 3].containsDuplicates);
  print([1, 2, 3, 4, 1].containsDuplicates);
  print(['Foo', 'Bar', 'Baz'].containsDuplicates);
  print(['Foo', 'Bar', 'Baz', 'Bar'].containsDuplicates);
  print("----------------------");
  final String? ageAsString =
      json.find<int>('age', (int age) => age.toString());
  final String helloName = json.find('name', (String name) => 'Hello $name')!;
  print(ageAsString);
  print(helloName);
  print("----------------------");
  print(AnimalType.cat.nameContainsUpperCaseLetters);
  print(AnimalType.goldFish.nameContainsUpperCaseLetters);
}

//Introduction...
extension on int {
  int get timesFour => this * 4;
}

//To reverse a string
extension on String {
  String get reversed => split('').reversed.join('');
}

//For summing an iterable
extension SumOfIterables<T extends num> on Iterable<T> {
  T get sum => reduce((a, b) => a + b as T);
}

//For creating ranges in Dart like so 1.to(10) -> Iterable [1,2,3,4,5,6,7,8,9,10];
extension on int {
  Iterable<int> to(int end, {bool inclusive = true}) => end > this
      ? [for (var i = this; i < end; i++) i, if (inclusive) end]
      : [for (var i = this; i > end; i--) i, if (inclusive) end];
}

//For creating and telling us whether an iterable contains duplicates
extension on Iterable {
  bool get containsDuplicates => toSet().length != length;
}

//Mapping the value of a key in a map
extension Find<K, V, R> on Map<K, V> {
  R? find<T>(K key, R? Function(T value) cast) {
    final value = this[key];
    if (value != null && value is T) {
      return cast(value as T);
    } else {
      return null;
    }
  }
}

//Extension on all enumerations...
enum AnimalType { cat, dog, goldFish }

extension on Enum {
  bool get nameContainsUpperCaseLetters => name.contains(RegExp(r'[A-Z]'));
}


