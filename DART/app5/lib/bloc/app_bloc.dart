import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/rendering.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
