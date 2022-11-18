import 'package:app4/bloc/bloc_actions.dart';
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

    //testing initial state

    blocTest<PersonBloc, FetchedResults?>(
      'testing initial state',
      build: () => bloc,
      verify: (bloc) => bloc.state == null,
    );

    //fetch mock data (person1) and comparte it with FetchResult
    blocTest(
      'Mock retrieving persons from first iterable',
      build: () => bloc,
      act: (bloc){
        bloc.add(const LoadPersonAction(url: 'dummy_url_1', loader: mockGetPersons1));
        bloc.add(const LoadPersonAction(url: 'dummy_url_1', loader: mockGetPersons1));
      },
    expect: () => [
      const FetchedResults(isRetrievedFromCache: false, persons: mockedPersons1),
      const FetchedResults(isRetrievedFromCache: true, persons: mockedPersons1),
    ],
    );


// fetch mock data (person2) and comparte it with FetchResult
    blocTest(
      'Mock retrieving persons from second iterable',
      build: () => bloc,
      act: (bloc){
        bloc.add(const LoadPersonAction(url: 'dummy_url_2', loader: mockGetPersons2));
        bloc.add(const LoadPersonAction(url: 'dummy_url_2', loader: mockGetPersons2));
      },
    expect: () => [
      const FetchedResults(isRetrievedFromCache: false, persons: mockedPersons2),
      const FetchedResults(isRetrievedFromCache: true, persons: mockedPersons2),
    ],
    );

  },);
}
