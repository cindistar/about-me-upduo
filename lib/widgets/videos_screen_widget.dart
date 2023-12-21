import 'package:about_me_upduo/widgets/parallax_flow_delegate_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosScreenWidget extends StatefulWidget {
  final Size screenSize;
  const VideosScreenWidget({super.key, required this.screenSize});

  @override
  State<VideosScreenWidget> createState() => _VideosScreenWidgetState();
}

class _VideosScreenWidgetState extends State<VideosScreenWidget> {
  late PageController _pageController;
  int _selectedIndex = 0;

  final videos = [
    'assets/videos/samba_brazil_27.mp4',
    'assets/videos/santos_beach.mp4',
    'assets/videos/carnaval.mp4',
    //'assets/videos/women_tech_event.mp4',
    'assets/videos/dua_lipa.mp4',
    //'assets/videos/friends1.mp4',
    'assets/videos/james_bday.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return VideoCardWidget(
              assetPath: videos[index],
              isSelected: _selectedIndex == index,
            );
          },
          onPageChanged: (i) => setState(() => _selectedIndex = i),
        ),
      ),
    );
  }
}

class VideoCardWidget extends StatefulWidget {
  const VideoCardWidget({
    super.key,
    required this.assetPath,
    required this.isSelected,
  });

  final String assetPath;
  final bool isSelected;

  @override
  State<VideoCardWidget> createState() => _VideoCardWidgetState();
}

class _VideoCardWidgetState extends State<VideoCardWidget> {
  late VideoPlayerController _videoPlayerController;
  final GlobalKey _videoKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.assetPath);

    _videoPlayerController
      ..addListener(() {})
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) => setState(() {}))
      ..play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: widget.isSelected
          ? const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 4,
            )
          : const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 20,
            ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 6),
            blurRadius: 8,
          )
        ],
      ),
      duration: const Duration(milliseconds: 250),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Flow(
          delegate: ParallaxFlowDelegateWidget(
              scrollable: Scrollable.of(context),
              listItemContext: context,
              backgroundImageKey: _videoKey),
          children: [
            AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(
                _videoPlayerController,
                key: _videoKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
