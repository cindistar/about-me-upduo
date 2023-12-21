import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:routefly/routefly.dart';

class DrivesPage extends StatefulWidget {
  const DrivesPage({super.key});

  @override
  State<DrivesPage> createState() => _DrivesPageState();
}

class _DrivesPageState extends State<DrivesPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);

    const assetsImagePath = "assets/images/mom_3.jpg";
    const text = "What Drives Me...";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Routefly.navigate('/');
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (double scrollOffset) {
              final offScreenPercentage =
                  min(scrollOffset / screenSize.height, 1.0);
              return Image.asset(
                width: screenSize.width -
                    (screenSize.width * 0.3 * offScreenPercentage),
                height: screenSize.height -
                    (screenSize.height * 0.5 * offScreenPercentage),
                assetsImagePath,
                fit: BoxFit.cover,
              );
            },
            offsetBuilder: (scrollOffset) {
              final offScreenPercentage =
                  min(scrollOffset / screenSize.height, 1.0);
              final heightShrinkageAmount =
                  (screenSize.height * 0.0 * offScreenPercentage);

              final bool startMovingImage =
                  scrollOffset >= screenSize.height * 0.8;
              final double onScreenOffset =
                  scrollOffset + heightShrinkageAmount / 2;
              return Offset(
                0,
                !startMovingImage
                    ? onScreenOffset
                    : onScreenOffset - (scrollOffset - screenSize.height * 0.8),
              );
            },
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) {
              return DrivesOverlayTextWidget(screenSize: screenSize);
            },
            offsetBuilder: (scrollOffset) => Offset(0, -screenSize.height),
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) {
              return DrivesBottomSection(screenSize: screenSize);
            },
          )
        ],
      ),
    );
  }
}

class DrivesOverlayTextWidget extends StatelessWidget {
  final Size screenSize;
  const DrivesOverlayTextWidget({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width > 800 &&
        MediaQuery.sizeOf(context).width < 2050;

    const text = "What\ndrives\nme";
    const normalText = "What drives me";
    const answerText =
        "Tea, in contrast to the majority of developers (I'm a tea lover), my family, the fear of boredom, and a relentless desire to prove that I can advance at least one milimeter everyday and deal sometimes with the imposter syndrome. I'm driven by passion, curiosity, creativity, a sense of humor, humanity, and humility, making friends with people from around the world, and the occasional indulgence in chocolate.";

    return SizedBox(
      width: screenSize.width,
      height: isMobile ? screenSize.height * 0.75 : screenSize.height,
      child: isMobile
          ? Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    text,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.yellow,
                      height: 0.7,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      wordSpacing: 0.0,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    answerText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            )
          : isMediumSize
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      normalText,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.yellow,
                        height: 0.7,
                        fontWeight: FontWeight.w900,
                        fontSize: 100,
                        wordSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 700,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        answerText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      text,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.yellow,
                        height: 0.7,
                        fontWeight: FontWeight.w900,
                        fontSize: 300,
                        wordSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(width: 100),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 700,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        answerText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
    );
  }
}

class DrivesBottomSection extends StatelessWidget {
  final Size screenSize;
  const DrivesBottomSection({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    const assetsImagePath1 = "assets/images/cats1.jpg";
    const assetsImagePath2 = "assets/images/family.jpg";

    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width > 800 &&
        MediaQuery.sizeOf(context).width < 2050;

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: isMobile
          ? Column(children: [
              Image.asset(
                height: screenSize.height * 0.5,
                assetsImagePath1,
                fit: BoxFit.cover,
              ),
              Image.asset(
                height: screenSize.height * 0.5,
                assetsImagePath2,
                fit: BoxFit.cover,
              ),
            ])
          : isMediumSize
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: screenSize.width * 0.5,
                      height: screenSize.height,
                      assetsImagePath1,
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      width: screenSize.width * 0.5,
                      height: screenSize.height,
                      assetsImagePath2,
                      fit: BoxFit.contain,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: screenSize.width * 0.5,
                      height: screenSize.height,
                      assetsImagePath1,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      width: screenSize.width * 0.5,
                      height: screenSize.height,
                      assetsImagePath2,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
    );
  }
}
