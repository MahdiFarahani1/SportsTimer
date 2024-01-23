import 'package:flutter/material.dart';

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
}
