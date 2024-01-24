import 'package:count_down_time/count_down_time.dart';
import 'package:delayed_widget/delayed_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:go_router/go_router.dart';
import 'package:sporttimer/main_feature/presentation/state_bloc/slider_cubit/cubit/slider_cubit.dart';
import 'package:sporttimer/main_feature/presentation/state_bloc/start_timer_cubit.dart/cubit/start_timer_cubit.dart';
import 'package:sporttimer/main_feature/repositories/audio_play.dart';
import 'package:sporttimer/main_feature/repositories/time_repository.dart';
import 'package:sporttimer/utils/fonts.dart';
import 'package:sporttimer/utils/widgets/widgets.dart';
import 'package:wakelock/wakelock.dart';

import '../state_bloc/plus_mines_cubit/cubit/counter_cubit.dart';

class TimerPage extends StatefulWidget {
  static String routeName = "/timer_page";

  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  void initState() {
    Wakelock.enable();

    BlocProvider.of<SliderCubit>(context).startTimerSlider(
        context, BlocProvider.of<CounterCubit>(context).state.roundNumber);
    super.initState();
  }

  var audio = AudioPlay();
  @override
  void dispose() {
    Wakelock.disable();

    super.dispose();
    audio.dispose();
    BlocProvider.of<SliderCubit>(context).dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> data = GoRouterState.of(context).extra as List<int>;
    int rounds = data[4] - 1;
    final int constround = data[4] - 1;

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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: BlocBuilder<SliderCubit, int>(
                        builder: (context, state) {
                          return LinearProgressIndicator(
                              value: state /
                                  (TimeLength.currentTimerLength(data: data) +
                                      (data[4] * 4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                              minHeight: 5,
                              color: Colors.amber,
                              backgroundColor: Colors.white);
                        },
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          BlocBuilder<StartTimerCubit, StartTimerState>(
                            builder: (context, state) {
                              if (state is StartTimerInitial) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CountDownTime(
                                      onTimeOut: () async {
                                        await Future.delayed(const Duration(
                                                milliseconds: 1200))
                                            .then((value) => BlocProvider.of<
                                                    StartTimerCubit>(context)
                                                .showText());
                                      },
                                      onChangeTime: (time) {
                                        if (time == 4) {
                                          audio.playCount();
                                        }
                                        if (time == 0) {
                                          audio.playRing();
                                        }
                                      },
                                      timeStartInSeconds: 5,
                                      textStyle: MyFonts.loraFont(
                                        fontsize: 70,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    DelayedWidget(
                                        animation:
                                            DelayedAnimations.SLIDE_FROM_BOTTOM,
                                        animationDuration:
                                            const Duration(milliseconds: 1500),
                                        delayDuration:
                                            const Duration(milliseconds: 200),
                                        child: MyWidgets.customText(
                                            text: "Start...")),
                                  ],
                                );
                              }
                              if (state is StartTimerDeleydText) {
                                BlocProvider.of<StartTimerCubit>(context)
                                    .startRound();

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
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CountDownTime(
                                      onChangeTime: (time) {
                                        if (time == 5) {
                                          audio.playCount();
                                        }
                                        if (time <= 1) {
                                          audio.playRing();
                                        }
                                      },
                                      onTimeOut: () async {
                                        await Future.delayed(
                                          const Duration(
                                            milliseconds: 1200,
                                          ),
                                        ).then((value) async {
                                          if (rounds > 0) {
                                            rounds--;

                                            BlocProvider.of<StartTimerCubit>(
                                                    context)
                                                .restTime();
                                          } else {
                                            BlocProvider.of<StartTimerCubit>(
                                                    context)
                                                .onFinish();
                                            await Future.delayed(const Duration(
                                                    milliseconds: 1100))
                                                .then((value) {
                                              BlocProvider.of<StartTimerCubit>(
                                                      context)
                                                  .initState();
                                              Navigator.pop(context, true);
                                            });
                                          }
                                        });
                                      },
                                      timeStartInSeconds:
                                          data[0] * 60 + data[1] + 1,
                                      textStyle: MyFonts.loraFont(
                                        fontsize: 70,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    MyWidgets.customText(
                                        text:
                                            "Round ${constround - (rounds - 1)}\n  ${constround - (rounds - 1)} of ${data[4]}"),
                                  ],
                                );
                              }
                              if (state is StartTimerRestTime) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TimerCountdown(
                                      onTick: (time) {
                                        if (time <=
                                            const Duration(seconds: 1)) {
                                          audio.playRing();
                                        } else if (time <=
                                            const Duration(seconds: 5)) {
                                          audio.playCount();
                                        }
                                      },
                                      colonsTextStyle: MyFonts.loraFont(
                                        fontsize: 70,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      enableDescriptions: false,
                                      onEnd: () {
                                        BlocProvider.of<StartTimerCubit>(
                                                context)
                                            .startRound();
                                      },
                                      format:
                                          CountDownTimerFormat.minutesSeconds,
                                      timeTextStyle: MyFonts.loraFont(
                                        fontsize: 70,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      endTime: DateTime.now().add(
                                        Duration(
                                          seconds: data[3] + 1,
                                          minutes: data[2],
                                        ),
                                      ),
                                    ),
                                    MyWidgets.customText(
                                        text:
                                            "Rest time\n    ${constround - (rounds - 1)} of ${data[4]}"),
                                  ],
                                );
                              }

                              if (state is StartTimerFinish) {
                                return Center(
                                    child: DelayedWidget(
                                  animation:
                                      DelayedAnimations.SLIDE_FROM_BOTTOM,
                                  animationDuration:
                                      const Duration(milliseconds: 800),
                                  delayDuration:
                                      const Duration(milliseconds: 100),
                                  child: Text(
                                    "Finish!",
                                    style: MyFonts.loraFont(
                                        fontsize: 60,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ));
                              }
                              return Container();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
