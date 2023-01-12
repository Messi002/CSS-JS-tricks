import 'dart:collection';

// import 'package:collection/collection.dart';

void main(List<String> args) {
  const notFound = null;
  const defaultString = '';

  final myList = SafeList(
      defaultValue: defaultString,
      absentValue: notFound,
      values: ['Foo', 'Bar']);

  print(myList[0]);
  print(myList[1]);
  print(myList[2]);
}

// class Person {
//   final String name;
//   final List<Person>? _siblings;
// //to hide list and not expose them...
//   UnmodifiableListView<Person>? get siblings =>
//       _siblings == null ? null : UnmodifiableListView(_siblings!);

//   const Person({required this.name, List<Person>? siblings})
//       : _siblings = siblings;
// }



///Creating our own list
class SafeList<T> extends ListBase<T> {
  final T absentValue;
  final T defaultValue;
  final List<T> _list;

  SafeList(
      {required this.defaultValue, required this.absentValue, List<T>? values})
      : _list = values ?? [];

  @override
  int get length => _list.length;

  @override
  T operator [](int index) => index < _list.length ? _list[index] : absentValue;

  @override
  void operator []=(int index, T value) => _list[index] = value;

  @override
  set length(int newLength) {
    if (newLength <= _list.length) {
      _list.length = newLength;
    } else {
      _list.addAll(List.filled(newLength - _list.length, defaultValue));
    }
  }

  @override
  T get first => _list.isNotEmpty ? _list.first : absentValue;

  @override
  T get last => _list.isNotEmpty ? _list.last : absentValue;
}
