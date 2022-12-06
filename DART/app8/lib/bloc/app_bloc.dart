import 'package:app8/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_events.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState.empty());
}
