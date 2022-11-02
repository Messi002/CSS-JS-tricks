import 'package:app4/counterbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(state.toString(), style: textTheme.headline3,);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            key: const Key('counterview_increment_floatingactionbutton'),
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
            ),
            SizedBox(height: 30,),
          FloatingActionButton(
            key: const Key('counterview_decrement_floatingactionbutton'),
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
            ),
        ],
      ),
    );
  }
}
