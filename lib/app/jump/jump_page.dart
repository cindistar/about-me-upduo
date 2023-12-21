import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class JumpPage extends StatefulWidget {
  const JumpPage({super.key});

  @override
  State<JumpPage> createState() => _JumpPageState();
}

class _JumpPageState extends State<JumpPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    const text = "What makes me jump out of bed...";
    const assetsImageText = 'assets/images/cindi_green.jpg';

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
      body: ListView(
        children: [
          Image.asset(
            width: screenSize.width,
            height: screenSize.height,
            assetsImageText,
            fit: BoxFit.cover,
          ),
          OverlayTextWidget(screenSize: screenSize),
          BottomSection(screenSize: screenSize)
        ],
      ),
    );
  }
}

class OverlayTextWidget extends StatelessWidget {
  final Size screenSize;
  const OverlayTextWidget({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width > 800 &&
        MediaQuery.sizeOf(context).width < 2050;

    const text = "What\nmakes me\njump out\nof bed...";
    const answerText =
        "I jump out of bed every morning because I'm incredibly passionate about life, people, Flutter, tech, and always hopeful for better days, no matter what happens. Each day is a step toward achieving my long-term goal of being a better human being and getting better at coding to solve problems and give back to society. That sense of purpose is what makes me eager to start the day. That being said, the need to earn a living and pay the bills also motivates me to get out of bed! XD";

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: isMobile
          ? Column(children: [
              const SizedBox(height: 20),
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
              const SizedBox(width: 100),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                width: 700,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 244, 168),
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
                  const SizedBox(height: 20),
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
                  const SizedBox(width: 100),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    width: 700,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 219, 244, 168),
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
                        fontSize: 250,
                        wordSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(width: 100),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 700,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 244, 168),
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

class BottomSection extends StatelessWidget {
  final Size screenSize;
  const BottomSection({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    List<String> assetsList = [
      'assets/images/ubuntu.jpg',
      'assets/images/diversity3.jpg',
      'assets/images/jaguar_amazon_forest.jpg',
      'assets/images/education.jpg',
      'assets/images/no_war.jpg',
      'assets/images/grajau_graffiti.jpg',
      'assets/images/helen_keller.jpg',
      'assets/images/bills_to_pay.jpg',
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
