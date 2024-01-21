import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sporttimer/main_feature/widgets/const_widgets.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(const CounterState(
            roundNumber: 3,
            secondTimeRound: 30,
            minTimeRound: 0,
            minRestTime: 0,
            secondRestTime: 30));

  plusRound() {
    emit(CounterState(
        minRestTime: state.minRestTime,
        minTimeRound: state.minTimeRound,
        secondRestTime: state.secondRestTime,
        secondTimeRound: state.secondTimeRound,
        roundNumber: state.roundNumber + 1));
  }

  minesRound(BuildContext context) {
    if (state.roundNumber > 1) {
      emit(CounterState(
          minRestTime: state.minRestTime,
          minTimeRound: state.minTimeRound,
          secondRestTime: state.secondRestTime,
          secondTimeRound: state.secondTimeRound,
          roundNumber: state.roundNumber - 1));
    } else {
      Constants.showDialogWithDelay(context);
    }
  }

  minesRestTime(BuildContext context) {
    if (state.secondRestTime > 5 || state.minRestTime > 0) {
      if (state.secondRestTime > 0) {
        emit(CounterState(
            minRestTime: state.minRestTime,
            secondRestTime: state.secondRestTime - 5,
            secondTimeRound: state.secondTimeRound,
            minTimeRound: state.minTimeRound,
            roundNumber: state.roundNumber));
      } else {
        emit(CounterState(
            minRestTime: state.minRestTime - 1,
            secondRestTime: 55,
            secondTimeRound: state.secondTimeRound,
            minTimeRound: state.minTimeRound,
            roundNumber: state.roundNumber));
      }
    } else {
      Constants.showDialogWithDelay(context);
    }
  }

  plusRestTime() {
    if (state.secondRestTime >= 55) {
      emit(CounterState(
          minRestTime: state.minRestTime + 1,
          secondRestTime: 0,
          secondTimeRound: state.secondTimeRound,
          minTimeRound: state.minTimeRound,
          roundNumber: state.roundNumber));
    } else {
      emit(CounterState(
          minRestTime: state.minRestTime,
          secondRestTime: state.secondRestTime + 5,
          secondTimeRound: state.secondTimeRound,
          minTimeRound: state.minTimeRound,
          roundNumber: state.roundNumber));
    }
  }

  plusRoundTimer() {
    if (state.secondTimeRound >= 55) {
      emit(CounterState(
          minTimeRound: state.minTimeRound + 1,
          secondTimeRound: 0,
          minRestTime: state.minRestTime,
          roundNumber: state.roundNumber,
          secondRestTime: state.secondRestTime));
    } else {
      emit(CounterState(
          minTimeRound: state.minTimeRound,
          secondTimeRound: state.secondTimeRound + 5,
          minRestTime: state.minRestTime,
          roundNumber: state.roundNumber,
          secondRestTime: state.secondRestTime));
    }
  }

  minesRoundTime(BuildContext context) {
    if (state.secondTimeRound > 5 || state.minTimeRound > 0) {
      if (state.secondTimeRound > 0) {
        emit(CounterState(
            minTimeRound: state.minTimeRound,
            secondTimeRound: state.secondTimeRound - 5,
            minRestTime: state.minRestTime,
            roundNumber: state.roundNumber,
            secondRestTime: state.secondRestTime));
      } else {
        emit(CounterState(
            minTimeRound: state.minTimeRound - 1,
            secondTimeRound: 55,
            minRestTime: state.minRestTime,
            roundNumber: state.roundNumber,
            secondRestTime: state.secondRestTime));
      }
    } else {
      Constants.showDialogWithDelay(context);
    }
  }
}
