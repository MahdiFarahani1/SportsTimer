import 'package:flutter/material.dart';
import 'package:sporttimer/main_feature/widgets/const_widgets.dart';
import 'package:sporttimer/utils/fonts.dart';

class BoxTimer extends StatelessWidget {
  final String title, imagePath;
  final int min;
  final int? secend;

  const BoxTimer(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.min,
      this.secend});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      width: width * 0.9,
      height: height * 0.11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              children: [
                Constants.iconBtn(
                    icon: Icons.add,
                    onTap: () {},
                    bgcol: Colors.black,
                    iconColor: Colors.white),
                Constants.iconBtn(
                    icon: Icons.remove,
                    onTap: () {},
                    bgcol: Colors.black,
                    iconColor: Colors.white),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: secend != null
                          ? min.toString().padLeft(2, "0")
                          : min.toString(),
                      style: MyFonts.loraFont(
                        fontsize: 35,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: secend != null ? ":" : "",
                      style: MyFonts.loraFont(
                        fontsize: 35,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: secend != null
                          ? secend.toString().padLeft(2, "0")
                          : "",
                      style: MyFonts.loraFont(
                        fontsize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      title,
                      style: MyFonts.loraFont(
                        fontsize: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          Positioned(
            right: 0,
            child: Container(
              height: height * 0.11,
              width: width * 0.2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12)),
                image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    imagePath,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
