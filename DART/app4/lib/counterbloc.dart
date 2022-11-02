import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  //add
  void increment() => emit(state + 1);

  //subtract
  void decrement() => emit(state - 1);
}
