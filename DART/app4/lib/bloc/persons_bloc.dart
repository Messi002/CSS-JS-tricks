import 'package:app4/bloc/person.dart';
import 'package:flutter/foundation.dart' show immutable;

extension IsEqualToIgnoringOrdering<T> on Iterable<T> {
  bool isEqualToIgnoringOrdering(Iterable<T> other) =>
      length == other.length &&
      {...this}.intersection({...other}).length == length;
}

@immutable
class FetchedResults {
  final bool isRetrievedFromCache;
  final Iterable<Person> persons;

  const FetchedResults({
    required this.isRetrievedFromCache,
    required this.persons,
  });

  @override
  String toString() =>
      'FetchedResults(isRetrievedFromCache: $isRetrievedFromCache, persons: $persons)';

  @override
  bool operator == (covariant FetchedResults other) =>
      persons.isEqualToIgnoringOrdering(other.persons) &&
      isRetrievedFromCache == other.isRetrievedFromCache;
      
      
      
}

class PersonBloc extends Bloc<LoadAction, FetchedResults?> {
  final Map<PersonsUrl, Iterable<Person>> _cache = {};
  PersonBloc() : super(null) {
    on<LoadPersonAction>((event, emit) async {
      final url = event.url;
      if (_cache.containsKey(url)) {
        final cachedPersons = _cache[url]!;
        final result =
            FetchedResults(isRetrievedFromCache: true, persons: cachedPersons);
        emit(result);
      } else {
        final persons = await getPersons(url.urlString);
        _cache[url] = persons;
        final result =
            FetchedResults(isRetrievedFromCache: false, persons: persons);
        emit(result);
      }
    });
  }
}
