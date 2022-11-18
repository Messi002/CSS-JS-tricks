// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'dart:io';

import 'package:app4/bloc/bloc_actions.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/person.dart';
import 'bloc/persons_bloc.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

extension SubScript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((res) => res.transform(utf8.decoder).join())
    .then((str) => jsonDecode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar')),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    context
                        .read<PersonBloc>()
                        .add(const LoadPersonAction(url: persons1Url, loader: getPersons));
                  },
                  child: const Text('Load person1')),
              TextButton(onPressed: () {
                 context
                        .read<PersonBloc>()
                        .add(const LoadPersonAction(url: persons2Url, loader: getPersons));
              }, child: const Text('Load person2'))
            ],
          ),
          BlocBuilder<PersonBloc, FetchedResults?>(
            builder: (context, state) {
              final Aperson = state?.persons;
              if (Aperson == null) {
                return const SizedBox();
              }
              return Expanded(
                  child: ListView.builder(
                      itemCount: Aperson.length,
                      itemBuilder: (context, int index) {
                        final Bperson = Aperson[index]!;

                        return ListTile(
                          title: Text(Bperson.name.toString()),
                          subtitle: Text(Bperson.age.toString()),
                        );
                      }));
            },
          )
        ],
      ),
    );
  }
}
