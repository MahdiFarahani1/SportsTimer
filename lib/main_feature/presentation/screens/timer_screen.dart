import 'package:count_down_time/count_down_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sporttimer/main_feature/presentation/state_bloc/start_timer_cubit.dart/cubit/start_timer_cubit.dart';
import 'package:sporttimer/utils/fonts.dart';

class TimerPage extends StatelessWidget {
  static String routeName = "/timer_page";
  TimerPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var data = GoRouterState.of(context).extra as List<int>;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        BlocProvider.of<StartTimerCubit>(context).initState();
        Navigator.pop(context, true);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Fight",
            style: MyFonts.loraFont(
              fontsize: 24,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(begin: Alignment.center, colors: [
                      Colors.grey.shade600.withAlpha(160),
                      Colors.transparent
                    ])),
                child: Stack(
                  children: [
                    BlocBuilder<StartTimerCubit, StartTimerState>(
                      builder: (context, state) {
                        if (state is StartTimerInitial) {
                          return CountDownTime(
                            onTimeOut: () {
                              BlocProvider.of<StartTimerCubit>(context)
                                  .showText();
                            },
                            timeStartInSeconds: 6,
                            textStyle: MyFonts.loraFont(
                              fontsize: 70,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        if (state is StartTimerDeleydText) {
                          BlocProvider.of<StartTimerCubit>(context).showTimer();
                          return Center(
                            child: Text(
                              "GO!",
                              style: MyFonts.loraFont(
                                  fontsize: 60,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                        if (state is StartTimerStarted) {
                          return CountDownTime(
                            onChangeTime: (time) {
                              if (time == 0) {
                                BlocProvider.of<StartTimerCubit>(context)
                                    .restTime();
                                print("heloo 000");
                              }
                            },
                            timeStartInSeconds: data[0] * 60 + data[1] + 1,
                            textStyle: MyFonts.loraFont(
                              fontsize: 70,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        if (state is StartTimerRestTime) {
                          return CountDownTime(
                            onTimeOut: () {},
                            timeStartInSeconds: 5,
                            textStyle: MyFonts.loraFont(
                              fontsize: 70,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade900,
                  radius: 35,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 36,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
