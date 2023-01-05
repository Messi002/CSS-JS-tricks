void main(List<String> args) {
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
  final String? firstName = names?.first;
  print(firstName ?? 'No names found');
  
}
