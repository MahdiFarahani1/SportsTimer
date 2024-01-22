import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporttimer/main_feature/presentation/screens/timer_screen.dart';
import 'package:sporttimer/main_feature/presentation/state_bloc/plus_mines_cubit/cubit/counter_cubit.dart';
import 'package:sporttimer/main_feature/widgets/box_time.dart';
import 'package:sporttimer/main_feature/widgets/const_widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sports timer",
          style: GoogleFonts.tiltPrism(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
        leading: Constants.iconAppbar(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(-1, 1, 1),
              child: Constants.iconAppbar(),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Column(
                  children: [
                    BoxTimer(
                      title: "Round length",
                      min: state.minTimeRound,
                      secend: state.secondTimeRound,
                      imagePath: "assets/images/1.jpg",
                      plus: () {
                        BlocProvider.of<CounterCubit>(context).plusRoundTimer();
                      },
                      mines: () {
                        BlocProvider.of<CounterCubit>(context)
                            .minesRoundTime(context);
                      },
                    ),
                    BoxTimer(
                      title: "Rest time",
                      min: state.minRestTime,
                      secend: state.secondRestTime,
                      imagePath: "assets/images/2.jpg",
                      plus: () {
                        BlocProvider.of<CounterCubit>(context).plusRestTime();
                      },
                      mines: () {
                        BlocProvider.of<CounterCubit>(context)
                            .minesRestTime(context);
                      },
                    ),
                    BoxTimer(
                      title: "Rounds",
                      min: state.roundNumber,
                      imagePath: "assets/images/3.jpg",
                      plus: () {
                        BlocProvider.of<CounterCubit>(context).plusRound();
                      },
                      mines: () {
                        BlocProvider.of<CounterCubit>(context)
                            .minesRound(context);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.sizeOf(context).width * 0.415,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 34,
              child: IconButton(
                  onPressed: () {
                    context.push(TimerPage.routeName, extra: [
                      BlocProvider.of<CounterCubit>(context).state.minTimeRound,
                      BlocProvider.of<CounterCubit>(context)
                          .state
                          .secondTimeRound,
                      BlocProvider.of<CounterCubit>(context).state.minRestTime,
                      BlocProvider.of<CounterCubit>(context)
                          .state
                          .secondRestTime,
                      BlocProvider.of<CounterCubit>(context).state.roundNumber,
                    ]);
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
