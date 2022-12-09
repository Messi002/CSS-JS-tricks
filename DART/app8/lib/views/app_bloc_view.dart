import 'package:app8/bloc/app_bloc.dart';
import 'package:app8/bloc/bloc_events.dart';
import 'package:app8/extensionis/stream/start_with.dart';
import 'package:flutter/material.dart';

class AppBlocView<T extends AppBloc> extends StatelessWidget {
  const AppBlocView({super.key});

  void startUpdatingBloc(BuildContext context) {
    Stream.periodic(
      const Duration(seconds: 10),
      (_) => const LoadNextUrlEvent(),
    ).startWith(const LoadNextUrlEvent()).forEach((element) {
      context.read<T>().add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
