import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporttimer/main_feature/presentation/state_bloc/plus_mines_cubit/cubit/counter_cubit.dart';

class TimeLength {
  static int currentTimerLength({required List<int> data}) {
    int totalDuration =
        (data![0] * 60 + data[1] + 1) * data[4]; // مدت زمان کل تایمر
    int restDuration =
        (data[2] * 60 + data[3] + 1) * (data[4] - 1); // مدت زمان استراحت
    int currentLength = totalDuration + restDuration;
    print("Tour time:  $currentLength");
    return currentLength;
  }

  static List<int> dataLenght(BuildContext context) {
    var a = BlocProvider.of<CounterCubit>(context).state;
    List<int> data = [
      a.minTimeRound,
      a.secondTimeRound,
      a.minRestTime,
      a.secondRestTime,
      a.roundNumber
    ];
    return data;
  }
}
