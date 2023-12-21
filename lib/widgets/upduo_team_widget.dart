import 'package:flutter/material.dart';

class UpduoTeamWidget extends StatelessWidget {
  const UpduoTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;
    var isMediumSize = MediaQuery.sizeOf(context).width > 800 &&
        MediaQuery.sizeOf(context).width < 2050;

    const assetsImagePath = "assets/images/me_learning_rust_and_ts.png";
    const text =
        " Me in 2024 at Upduo:\n 'Dart and Python,\n meet your new siblings\n Rust and Typescript!'";

    return isMobile
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(text),
                Image.asset(
                  assetsImagePath,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )
        : isMediumSize
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 100,
                  top: 100,
                  right: 100,
                  bottom: 100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      text,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Image.asset(
                        height: 700,
                        width: double.maxFinite,
                        assetsImagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  left: 200,
                  top: 100,
                  right: 200,
                  bottom: 100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      text,
                      style: TextStyle(
                        fontSize: 43,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        height: 700,
                        width: double.maxFinite,
                        assetsImagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
  }
}
