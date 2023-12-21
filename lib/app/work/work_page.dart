import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);

    const text = "I worked on before...";
    const assetsImagePath = 'assets/images/cindi_flutter_meetup2.jpg';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
      body: ListView(
        children: [
          Image.asset(
            width: screenSize.width,
            height: screenSize.height,
            assetsImagePath,
            fit: BoxFit.cover,
          ),
          WorkOverlayTextWidget(screenSize: screenSize),
          WorkBottomSection(screenSize: screenSize)
        ],
      ),
    );
  }
}

class WorkOverlayTextWidget extends StatelessWidget {
  final Size screenSize;
  const WorkOverlayTextWidget({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    const text = "I\nworked\non\nbefore...";
    const answerText =
        "Before becoming a developer, I worked in different roles. So when it comes to flexibility, active listening, and dealing with totally different people and customers, I know the drill. My past jobs included roles such as a saleswoman assistant (clothes), coffee shop assistant, administrative assistant, babysitter, cleaner, and telemarketing attendant.";

    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width > 800 &&
        MediaQuery.sizeOf(context).width < 2050;

    return SizedBox(
      width: screenSize.width,
      height: isMobile
          ? screenSize.height * 0.8
          : isMediumSize
              ? screenSize.height * 0.8
              : screenSize.height,
      child: isMobile
          ? Column(children: [
              const SizedBox(height: 40),
              const Text(
                text,
                softWrap: true,
                style: TextStyle(
                  height: 0.7,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  wordSpacing: 0.0,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 203, 255),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  answerText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ])
          : isMediumSize
              ? Column(children: [
                  const SizedBox(height: 40),
                  const Text(
                    text,
                    softWrap: true,
                    style: TextStyle(
                      height: 0.7,
                      fontWeight: FontWeight.w900,
                      fontSize: 80,
                      wordSpacing: 0.0,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 221, 203, 255),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      answerText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ])
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      text,
                      softWrap: true,
                      style: TextStyle(
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
                        color: const Color.fromARGB(255, 221, 203, 255),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        answerText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

class WorkBottomSection extends StatelessWidget {
  final Size screenSize;
  const WorkBottomSection({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    List<String> assetsList = [
      'assets/images/coffe_shop.jpg',
      'assets/images/call_center.jpg',
      'assets/images/baby_sitter.jpg',
      'assets/images/office.jpg',
      'assets/images/clothes_store.jpg',
      'assets/images/cleaner.jpg',
    ];
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          assetsList.length,
          (index) {
            return Container(
              color: Colors.green,
              width: 200,
              height: 50,
              child: Image.asset(
                width: screenSize.width,
                height: screenSize.height,
                assetsList[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
