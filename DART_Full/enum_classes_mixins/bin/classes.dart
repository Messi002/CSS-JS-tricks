//What is a constructor? It is a function usually with the name of its class itself
//whose job is to create an instance of that class







class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  //or another of redoing the consturctor is
  //Person({required String name, required int age}) : name = name, age = age;

  //--------------
  //For a named constructor with an initializer... do it this way
  const Person.foo()
      : name = 'Foo',
        age = 22;
  //For the case of hard-coded name and accepting age as a parameter... do it this way
  const Person.bar(this.age) : name = 'Bar';

  //For making them optional... do it this way
   const Person.baz(
    String? name,
    int? age
   )
      : name = name ?? 'Baz',
        age = age ?? 15;
}

//----------------------------------------

