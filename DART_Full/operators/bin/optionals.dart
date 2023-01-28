void main(List<String> args) {
  String? firstName;
  String? lastName;
  String? nullName;
  // lastName ??= 'Bar';
  // print(lastName);
  print(lastName?.length);

  ///??, ??=,?.
  //It's possible to chain null-aware operators
  print(lastName ?? nullName ?? 'Baz');

//For container variables like Lists
  List<String?>? names;
  // final String? firstName = names?.first;
  // print(firstName ?? 'No names found');

  //Flat map
  final fullNames = firstName.flatMap(
        (f) => lastName.flatMap(
          (l) => '$f $l',
        ),
      ) ??
      'Either firstName or lastName or Both are null';

//Providing optionals default values in dart
  print(getFullNames("firstName", "null"));
}

String getFullName(
  String? firstName,
  String? lastName,
) =>
    withAll([firstName, lastName], (names) => names.join(' ')) ?? 'Empty';

T? withAll<T>(
  List<T?> optionals,
  T Function(List<T>) callback,
) =>
    optionals.any((e) => e == null) ? null : callback(optionals.cast<T>());

//FlatMaps in dart
extension FlatMap<T> on T? {
  R? flatMap<R>(R? Function(T) callback) {
    final shadow = this;
    if (shadow == null) {
      return null;
    } else {
      return callback(shadow);
    }
  }
}

//Providing optionals default values in dart
String getFullNames(
  String? firstName, 
  String? lastName,
) => '${firstName.orDefault} ${lastName.orDefault}';


extension DefaultValues<T> on T? {
  T get orDefault {
    final shadow = this;
    if (shadow != null) {
      return shadow;

