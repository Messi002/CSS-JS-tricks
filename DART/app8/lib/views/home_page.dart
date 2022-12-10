import 'package:app8/bloc/bottom_bloc.dart';
import 'package:app8/bloc/top_bloc.dart';
import 'package:app8/models/constants.dart';
import 'package:app8/views/app_bloc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

        
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TopBloc>(
              create: (context) => TopBloc(
                  waitBeforeLoading: const Duration(seconds: 3), urls: images),
            ),
            BlocProvider<BottomBloc>(
              create: (context) => BottomBloc(
                  waitBeforeLoading: const Duration(seconds: 3), urls: images),
            ),
          ],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              AppBlocView<TopBloc>(),
              AppBlocView<BottomBloc>(),
            ],
          ),
        ),
      ),
    );
  }
}
