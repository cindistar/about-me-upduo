import 'package:flutter/material.dart';

class PhotoCardListWidget extends StatelessWidget {
  const PhotoCardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;

    List<String> assetsList = [
      'assets/images/flutter1.jpg',
      'assets/images/flutter2.jpg',
      'assets/images/flutter3.jpg',
      'assets/images/dash.jpg',
      'assets/images/tech_women.jpg',
      'assets/images/flutter4.jpg',
    ];

    return Container(
      margin: isMobile
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.symmetric(horizontal: 200),
      width: isMobile ? 300 : double.maxFinite,
      height: 500,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: assetsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              width: 400,
              height: isMobile ? 250 : 500,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  assetsList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 80),
      ),
    );
  }
}
