import 'app_bloc.dart';

class BottomBloc extends AppBloc {
  BottomBloc({Duration? waitBeforeLoading, required Iterable<String> urls})
      : super(
        urls:urls,
        waitBeforeLoading: waitBeforeLoading,
      );
}
