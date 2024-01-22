import 'package:count_down_time/count_down_time.dart';
import 'package:flutter/material.dart';
import 'package:sporttimer/utils/fonts.dart';

class TimerPage extends StatelessWidget {
  static String routeName = "/timer_page";
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: CountDownTime(
                onTimeOut: () {},
                timeStartInSeconds: 90,
                textStyle: MyFonts.loraFont(
                  fontsize: 70,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade900,
                radius: 35,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 36,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
