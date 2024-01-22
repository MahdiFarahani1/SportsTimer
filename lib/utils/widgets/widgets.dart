import 'package:flutter/material.dart';
import 'package:sporttimer/main_feature/presentation/screens/timer_screen.dart';
import 'package:sporttimer/utils/fonts.dart';

class MyWidgets {
  static Widget customText({required String text}) {
    return Text(
      text,
      style: MyFonts.loraFont(
        fontsize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget customSlider(
      int value, int max, int rounds, int currentRound, List<int> data) {
    double currentLength =
        TimerPage.currentTimerLength(rounds, currentRound, data);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
      child: LinearProgressIndicator(
        value: currentLength,
        minHeight: 10,
        color: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}
