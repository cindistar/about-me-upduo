import 'package:flutter/material.dart';

class UpduoValuesWidget extends StatelessWidget {
  const UpduoValuesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width > 800 &&
        MediaQuery.sizeOf(context).width < 1700;

    const assetsImagePath = "assets/images/upduo_logo.png";
    const upduoValuesText =
        " Cutting-edge technologies\n Commited to personal growth\n Fosters psychological safety\n Creative + innovative\n High quality code base\n Flexible work arrangements\n Work life balance\n Actively practices inclusion\n";

    return Container(
      margin: isMobile
          ? const EdgeInsets.only(top: 50, bottom: 20)
          : isMediumSize
              ? const EdgeInsets.only(top: 100)
              : const EdgeInsets.only(top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isMobile
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 243, 230, 113),
                      backgroundImage: AssetImage(assetsImagePath),
                      radius: 50,
                    ),
                  ),
                )
              : isMediumSize
                  ? const Center(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 243, 230, 113),
                        backgroundImage: AssetImage(assetsImagePath),
                        radius: 110,
                      ),
                    )
                  : const Center(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 243, 230, 113),
                        backgroundImage: AssetImage(assetsImagePath),
                        radius: 300,
                      ),
                    ),
          const SizedBox(width: 50),
          Container(
            alignment: Alignment.center,
            child: isMobile
                ? const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      upduoValuesText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 0.9,
                        wordSpacing: 0.0,
                      ),
                    ),
                  )
                : isMediumSize
                    ? const Text(
                        upduoValuesText,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          height: 0.9,
                          wordSpacing: 0.0,
                        ),
                      )
                    : const Text(
                        upduoValuesText,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
