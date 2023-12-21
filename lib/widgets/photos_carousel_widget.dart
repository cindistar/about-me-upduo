import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PhotosCarouselWidget extends StatefulWidget {
  const PhotosCarouselWidget({super.key});

  @override
  State<PhotosCarouselWidget> createState() => _VideosCarouselWidgetState();
}

class _VideosCarouselWidgetState extends State<PhotosCarouselWidget> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final List _isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  int _current = 0;

  final List<String> images = [
    'assets/images/band1.jpg',
    'assets/images/flutter_meetup2.jpg',
    'assets/images/friends2.jpg',
    'assets/images/friends6.jpg',
    'assets/images/flutter_meetup1.jpg',
    'assets/images/friends4.jpg',
    'assets/images/flutterando_friends.jpg',
    'assets/images/friends9.jpg',
  ];

  final List<String> places = [
    'CREATIVITY',
    'DIVERSITY',
    'INNOVATION',
    'KINDNESS',
    'TRUST',
    'INCLUSION',
    'EMPATHY',
    'COLLECTIVITY',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              places[_current],
              style: TextStyle(
                letterSpacing: 8,
                fontSize: screenSize.width / 20,
                color: const Color.fromARGB(255, 164, 228, 168),
              ),
            ),
          ),
        ),
        screenSize.width < 800
            ? Container()
            : AspectRatio(
                aspectRatio: 17 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 8,
                        right: screenSize.width / 8,
                      ),
                      child: Card(
                        color: const Color.fromARGB(255, 198, 248, 145),
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 50,
                            bottom: screenSize.height / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          places[i],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: _isHovering[i]
                                                ? Colors.green
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
