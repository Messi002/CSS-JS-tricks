// import 'package:app4/timer_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class ActionCenter extends StatelessWidget {
//   const ActionCenter({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TimerBloc, TimerState>(
//       buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
//       builder: (context, state) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             if (state is TimerInitial) ...[
//               FloatingActionButton(
//                 child: Icon(Icons.play_arrow),
//                 onPressed: () => context
//                     .read<TimerBloc>()
//                     .add(TimerStarted(duration: state.duration)),
//               ),
//             ],
//             if (state is TimerRunInProgress) ...[
//               FloatingActionButton(
//                 child: Icon(Icons.pause),
//                 onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
//               ),
//               FloatingActionButton(
//                 child: Icon(Icons.replay),
//                 onPressed: () => context.read<TimerBloc>().add(TimerReset()),
//               ),
//             ],
//             if (state is TimerRunPause) ...[
//               FloatingActionButton(
//                 child: Icon(Icons.play_arrow),
//                 onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
//               ),
//               FloatingActionButton(
//                 child: Icon(Icons.replay),
//                 onPressed: () => context.read<TimerBloc>().add(TimerReset()),
//               ),
//             ],
//             if (state is TimerRunComplete) ...[
//               FloatingActionButton(
//                 child: Icon(Icons.replay),
//                 onPressed: () => context.read<TimerBloc>().add(TimerReset()),
//               ),
//             ]
//           ],
//         );
//       },
//     );
//   }
// }
