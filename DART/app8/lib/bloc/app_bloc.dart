import 'dart:math' as math;

import 'package:app8/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_events.dart';

typedef AppBlocRandomUrlPicker = String Function(Iterable<String> allUrls);

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(
        math.Random().nextInt(length),
      );
}

class AppBloc extends Bloc<AppEvent, AppState> {
  String _pickRandomUrl(Iterable<String> allUrls) => allUrls.getRandomElement();
  AppBloc({
    required Iterable<String> urls,
    Duration? waitBeforeLoading,
    AppBlocRandomUrlPicker? urlPicker,
  }) : super(const AppState.empty()) {
    on<LoadNextUrlEvent>((event, emit) async {
      //start loading
      emit(const AppState(isLoading: true, data: null, error: null));
      final url = (urlPicker ?? _pickRandomUrl)(urls);

      try {
        dad 
      } catch (e) {
        print(e); 
      }
    });
  }
}
