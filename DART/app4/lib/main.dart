// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => PersonBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonAction implements LoadAction {
  final PersonUrl url;
  const LoadPersonAction({required this.url}) : super();
}

enum PersonUrl { person1, person2 }

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.person1:
        return 'http://127.0.0.1:5500/app4/api/person1.json';
      case PersonUrl.person2:
        return 'http://127.0.0.1:5500/app4/api/person2.json';
    }
  }
}

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

@immutable
class Person {
  final String name;
  final int age;
  const Person({
    required this.name,
    required this.age,
  });

  Person copyWith({
    String? name,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  @override
  String toString() => 'Person(name: $name, age: $age)';
}

//converting data
Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close()) //close request to get response
    .then((resp) => resp.transform(utf8.decoder).join()) //future of string
    .then((str) => json.decode(str) as List<dynamic>) //future of list
    .then((list) => list.map((e) => Person.fromJson(e))); //future of iterable

@immutable
class FetchedResults {
  final Iterable<Person> persons;
  final bool isRetrievedFromCache;
  const FetchedResults({
    required this.persons,
    required this.isRetrievedFromCache,
  });

  @override
  String toString() =>
      'FetchResult (isRetrievedFromCahce = $isRetrievedFromCache, persons = $persons';
}

class PersonBloc extends Bloc<LoadAction, FetchedResults?> {
  final Map<PersonUrl, Iterable<Person>> _cache = {};
  PersonBloc() : super(null) {
    on<LoadPersonAction>(
      (event, emit) async {
        final url = event.url;
        if (_cache.containsKey(url)) {
          //we have the value in the cache;
          final cachedPersons = _cache[url]!;
          //TODO: print cached persons and cache url
          final result = FetchedResults(
              persons: cachedPersons, isRetrievedFromCache: true);
          emit(result);
        } else {
          final persons = await getPersons(url.urlString);
          _cache[url] = persons;
          //TODO: print _cache
          final result =
              FetchedResults(persons: persons, isRetrievedFromCache: true);
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    context
                        .read<PersonBloc>()
                        .add(const LoadPersonAction(url: PersonUrl.person1));
                  },
                  child: const Text("Load json #1")),
              TextButton(
                  onPressed: () {
                    context
                        .read<PersonBloc>()
                        .add(const LoadPersonAction(url: PersonUrl.person2));
                  },
                  child: const Text("Load json #2")),
            ],
          ),
          BlocBuilder<PersonBloc, FetchedResults?>(builder: (context, state) {
            return Container();
          })
        ],
      ),
    );
  }
}
