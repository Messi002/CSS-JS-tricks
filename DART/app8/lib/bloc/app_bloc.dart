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
  AppBloc({
    AppBlocRandomUrlPicker? urlPicker,
  }) : super(const AppState.empty());
}
