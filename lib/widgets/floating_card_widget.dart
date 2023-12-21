import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class FloatingCardWidget extends StatefulWidget {
  final Size screenSize;
  const FloatingCardWidget({
    super.key,
    required this.screenSize,
  });

  @override
  State<FloatingCardWidget> createState() => _FloatingCardWidgetState();
}

class _FloatingCardWidgetState extends State<FloatingCardWidget> {
  bool isHoveredText1 = false;
  bool isHoveredText2 = false;
  bool isHoveredText3 = false;

  List<String> textsList = [
    "I worked on before",
    "What makes me jump out of bed",
  ];

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;

    return Container(
      color: Colors.transparent,
      width: isMobile ? 400 : 900,
      height: 100,
      child: Card(
        color: Colors.yellow,
        shadowColor: Colors.grey,
        elevation: 0.4,
        child: isMobile
            ? Column(
                children: [
                  GestureDetector(
                    onTap: () => Routefly.navigate('/work'),
                    child: MouseRegion(
                      onEnter: (f) {
                        setState(() {
                          isHoveredText1 = true;
                        });
                      },
                      onExit: (f) {
                        setState(() {
                          isHoveredText1 = false;
                        });
                      },
                      child: Text(
                        textsList[0],
                        style: TextStyle(
                          color: isHoveredText1 ? Colors.blue : Colors.black,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(color: Colors.black),
                  GestureDetector(
                    onTap: () => Routefly.navigate('/jump'),
                    child: MouseRegion(
                      onEnter: (f) {
                        setState(() {
                          isHoveredText2 = true;
                        });
                      },
                      onExit: (f) {
                        setState(() {
                          isHoveredText2 = false;
                        });
                      },
                      child: Text(
                        textsList[1],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isHoveredText2 ? Colors.blue : Colors.black,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Routefly.navigate('/work'),
                    child: MouseRegion(
                      onEnter: (f) {
                        setState(() {
                          isHoveredText1 = true;
                        });
                      },
                      onExit: (f) {
                        setState(() {
                          isHoveredText1 = false;
                        });
                      },
                      child: Text(
                        textsList[0],
                        style: TextStyle(
                          color: isHoveredText1 ? Colors.blue : Colors.black,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(color: Colors.black),
                  GestureDetector(
                    onTap: () => Routefly.navigate('/jump'),
                    child: MouseRegion(
                      onEnter: (f) {
                        setState(() {
                          isHoveredText2 = true;
                        });
                      },
                      onExit: (f) {
                        setState(() {
                          isHoveredText2 = false;
                        });
                      },
                      child: Text(
                        textsList[1],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isHoveredText2 ? Colors.blue : Colors.black,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
