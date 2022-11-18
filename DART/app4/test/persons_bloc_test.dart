import 'package:app4/bloc/person.dart';
import 'package:app4/bloc/persons_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

const mockedPersons1 = [
  Person(age: 20, name: 'Austin'),
  Person(age: 30, name: 'Gareth'),
];

const mockedPersons2 = [
  Person(age: 20, name: 'August'),
  Person(age: 30, name: 'Dareth'),
];

Future<Iterable<Person>> mockGetPersons1(String _) =>
    Future.value(mockedPersons1);

Future<Iterable<Person>> mockGetPersons2(String _) =>
    Future.value(mockedPersons2);

void main() {
  group('Testing bloc', () {
    //write out tests

    late PersonBloc bloc;

    setUp(() {
      bloc = PersonBloc();
    });

    blocTest<PersonBloc, FetchedResults?>(
      'testing initial state',
      build: () => bloc,
      verify: (bloc) => bloc.state == null,
    );
  });
}
