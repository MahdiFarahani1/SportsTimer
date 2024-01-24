import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sporttimer/main_feature/repositories/time_repository.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<int> {
  SliderCubit() : super(0);
  late Timer _timer;
  void startTimerSlider(BuildContext context, int R) {
    emit(0);
    int allTime =
        TimeLength.currentTimerLength(data: TimeLength.dataLenght(context));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state + 1);
      if (state == allTime + (R * 4)) {
        _timer.cancel();
      }
    });
  }

  dispose() {
    _timer.cancel();
  }
}
