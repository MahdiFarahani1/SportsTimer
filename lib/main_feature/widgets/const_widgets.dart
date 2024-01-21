import 'package:flutter/material.dart';

class Constants {
  static Widget iconAppbar() {
    return const Icon(
      Icons.sports_gymnastics_sharp,
      size: 30,
      color: Colors.black87,
    );
  }

  static Widget iconBtn(
      {required IconData icon,
      required Function onTap,
      required Color bgcol,
      required Color iconColor}) {
    return IconButton(
      onPressed: () {
        onTap();
      },
      icon: CircleAvatar(
        backgroundColor: bgcol,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
