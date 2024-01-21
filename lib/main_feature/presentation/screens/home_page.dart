import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sporttimer/main_feature/widgets/box_time.dart';
import 'package:sporttimer/main_feature/widgets/const_widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sports timer",
          style: GoogleFonts.tiltPrism(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
        leading: Constants.iconAppbar(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(-1, 1, 1),
              child: Constants.iconAppbar(),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          const Center(
            child: Column(
              children: [
                BoxTimer(
                  title: "Round length",
                  min: 10,
                  secend: 46,
                  imagePath: "assets/images/1.jpg",
                ),
                BoxTimer(
                  title: "Rest time",
                  min: 4,
                  secend: 9,
                  imagePath: "assets/images/2.jpg",
                ),
                BoxTimer(
                  title: "Rounds",
                  min: 3,
                  imagePath: "assets/images/3.jpg",
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.sizeOf(context).width * 0.415,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 34,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
