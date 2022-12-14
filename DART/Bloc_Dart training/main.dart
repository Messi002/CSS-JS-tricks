import 'package:bloc/bloc.dart';
import 'dart:async';

// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);

//   void increment() => emit(state + 1);

//   @override
//   void onError(Object error, StackTrace stackTrace) {
//     super.onError(error, stackTrace);
//     print("$error, $stackTrace");
//   }
// }

// void main() {
//   CounterCubit cubit = CounterCubit();

//   print(cubit.state);
//   cubit.increment();
//   print(cubit.state);
//   cubit.increment();
//   print(cubit.state);
//   cubit.close();
// }

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    // ignore: invalid_use_of_visible_for_testing_member
    on<CounterIncrementPressed>((event, state) => emit((state as int)));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('This is an error');
    print("$error, $stackTrace");
  }
}

Future<void> main() async {
  final bloc = CounterBloc();

  print(bloc.state);
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration(seconds: 3));
  print(bloc.state);
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration(seconds: 3));
  print(bloc.state);
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration(seconds: 3));
  print(bloc.state);
  await bloc.close();
}



//fluter pub upgrade major--versions