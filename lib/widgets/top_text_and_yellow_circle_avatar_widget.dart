import 'package:flutter/material.dart';

class TopTextAndYellowCircleAvatarWidget extends StatelessWidget {
  const TopTextAndYellowCircleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width >= 800 &&
        MediaQuery.sizeOf(context).width < 2050;

    const assetsImagePath = "assets/images/cindi_yellow1.png";
    const text =
        "Hi! My name\n is Cindi\n and I'm a\n Flutter\n Developer\n from Brazil!";

    return isMobile
        ? Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: const Text(text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 0.9,
                        wordSpacing: 0.0,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(assetsImagePath),
                    radius: 80,
                  ),
                )
              ],
            ),
          )
        : isMediumSize
            ? Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(text,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            height: 0.9,
                            wordSpacing: 0.0,
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(assetsImagePath),
                        radius: 175,
                      ),
                    )
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text(text,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          height: 0.9,
                          wordSpacing: 0.0,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40, bottom: 20),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(assetsImagePath),
                      radius: 395,
                    ),
                  ),
                ],
              );
  }
}
