import 'package:flutter/material.dart';

class TopTextHover extends StatefulWidget {
  final int index;
  final VoidCallback onTap;
  const TopTextHover({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  State<TopTextHover> createState() => _TopTextHoverState();
}

class _TopTextHoverState extends State<TopTextHover> {
  bool isHovered = false;

  List<String> topBarTexts = [
    "About Me",
    "Home",
    "What drives me",
    "Topics I'm excited about",
  ];

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (f) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (f) {
          setState(() {
            isHovered = false;
          });
        },
        child: isMobile
            ? Column(children: [
                if (widget.index == 0)
                  Text(
                    topBarTexts[widget.index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                if (widget.index != 0)
                  Text(
                    topBarTexts[widget.index],
                    style: TextStyle(
                      color: isHovered
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.black,
                      fontSize: 26,
                    ),
                  ),
              ])
            : Row(
                children: [
                  if (widget.index == 0)
                    Text(
                      topBarTexts[widget.index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  if (widget.index != 0)
                    Text(
                      topBarTexts[widget.index],
                      style: TextStyle(
                        color: isHovered
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.black,
                        fontSize: 26,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
