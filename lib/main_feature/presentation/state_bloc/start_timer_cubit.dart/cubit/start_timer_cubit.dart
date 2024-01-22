import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'start_timer_state.dart';

class StartTimerCubit extends Cubit<StartTimerState> {
  StartTimerCubit() : super(StartTimerInitial());
  showText() {
    emit(StartTimerDeleydText());
  }

  startRound() async {
    await Future.delayed(const Duration(seconds: 1), () {}).then((value) {
      emit(StartTimerStarted());
    });
  }

  initState() {
    emit(StartTimerInitial());
  }

  restTime() {
    emit(StartTimerRestTime());
  }

  onFinish() {
    emit(StartTimerFinish());
  }
}
