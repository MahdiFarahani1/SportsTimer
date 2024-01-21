// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFonts {
  static TextStyle loraFont(
      {required double fontsize,
      required Color color,
      FontWeight? fontWeight}) {
    return GoogleFonts.lora(
      fontSize: fontsize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
