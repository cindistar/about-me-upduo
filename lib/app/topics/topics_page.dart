import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:routefly/routefly.dart';

import '../../widgets/videos_screen_widget.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);

    const text = "Topics I'm excited about...";
    const assetsImagePath = 'assets/images/brazilian_setup.jpg';

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
              return TopicsOverlayTextWidget(screenSize: screenSize);
            },
            offsetBuilder: (scrollOffset) => Offset(0, -screenSize.height),
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) {
              return TopicsBottomSection(screenSize: screenSize);
            },
          )
        ],
      ),
    );
  }
}

class TopicsOverlayTextWidget extends StatelessWidget {
  final Size screenSize;
  const TopicsOverlayTextWidget({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width > 800 &&
        MediaQuery.sizeOf(context).width < 2050;

    const text = "Topics\nI'm\nexcited\nabout";
    const normalText = "Topics I'm excited about";
    const answerText =
        " - Learning;\n - Technology;\n - Science;\n - Coding;\n - Education;\n - Fashion;\n - Books;\n - Clean, testable and scalable code;\n - Pop culture;\n - Rock 'n Roll 🤘;\n - Pop music and its divas;\n - Singing;\n - Latin energy, music and dance;\n - Carnaval and Brazilian bread cheese;\n - Pets;\n - Parties;\n - Exploring the profound science of naming variables;\n - Physical activity;\n - And so forth...";

    return SizedBox(
      width: screenSize.width,
      height: isMobile ? screenSize.height * 0.75 : screenSize.height,
      child: isMobile
          ? Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  text,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.yellow,
                    height: 0.7,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    wordSpacing: 0.0,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    answerText,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 0.0,
                    ),
                  ),
                ),
              ],
            )
          : isMediumSize
              ? Column(
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
                    const SizedBox(width: 100, height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 20, bottom: 40),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        answerText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 0.0,
                        ),
                      ),
                    ),
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
                        fontSize: 250,
                        wordSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(width: 50),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        answerText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 0.0,
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

class TopicsBottomSection extends StatelessWidget {
  final Size screenSize;
  const TopicsBottomSection({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width > 800 &&
        MediaQuery.sizeOf(context).width < 2050;

    String racionaisQuoteText =
        "'Education\nis the most\npowerful\nweapon\nwhich you can\n use to change\n the world.'";
    String racionaisQuoteNormalText =
        "'Education is the most powerful weapon which you can use to change the world.'";
    String byRacionaisText = "By Nelson Mandela";

    return isMobile
        ? Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 20, top: 50, right: 20, bottom: 20),
                padding: const EdgeInsets.only(
                    left: 20, top: 50, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    Text(
                      racionaisQuoteText,
                      style: const TextStyle(
                        height: 0.7,
                        fontSize: 30,
                        wordSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(height: 100),
                    Text(
                      byRacionaisText,
                      style: const TextStyle(
                        height: 0.7,
                        fontSize: 20,
                        wordSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                width: 400,
                height: 500,
                child: VideosScreenWidget(
                  screenSize: screenSize,
                ),
              ),
            ],
          )
        : isMediumSize
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 50),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          Text(
                            racionaisQuoteNormalText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                height: 0.7,
                                fontSize: 100,
                                wordSpacing: 0.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 100),
                          Text(
                            byRacionaisText,
                            style: const TextStyle(
                              height: 0.7,
                              fontSize: 30,
                              wordSpacing: 0.0,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 60, top: 20, bottom: 20),
                    width: 700,
                    height: 700,
                    child: VideosScreenWidget(
                      screenSize: screenSize,
                    ),
                  ),
                ],
              )
            : SizedBox(
                width: screenSize.width,
                height: screenSize.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 50),
                        margin: const EdgeInsets.only(bottom: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: [
                            Text(
                              racionaisQuoteText,
                              style: const TextStyle(
                                  height: 0.7,
                                  fontSize: 160,
                                  wordSpacing: 0.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 100),
                            Text(
                              byRacionaisText,
                              style: const TextStyle(
                                height: 0.7,
                                fontSize: 30,
                                wordSpacing: 0.0,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 60, top: 20, bottom: 20),
                      width: 700,
                      height: 800,
                      child: VideosScreenWidget(
                        screenSize: screenSize,
                      ),
                    ),
                  ],
                ),
              );
  }
}
