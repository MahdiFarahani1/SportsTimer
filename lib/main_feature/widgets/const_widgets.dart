import 'package:flutter/material.dart';
import 'package:sporttimer/utils/fonts.dart';

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

  static void showDialogWithDelay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Container(
            height: 40,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.redAccent,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "is the lowest value",
                  style: MyFonts.loraFont(
                    fontsize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          backgroundColor: Colors.grey.shade900,
        );
      },
    );
  }
}
