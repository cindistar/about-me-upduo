import 'package:about_me_upduo/widgets/contact_info_widget.dart';
import 'package:about_me_upduo/widgets/floating_card_widget.dart';
import 'package:about_me_upduo/widgets/photo_card_list_widget.dart';
import 'package:about_me_upduo/widgets/photos_carousel_widget.dart';
import 'package:about_me_upduo/widgets/top_bar_contents_mobile_widget.dart';
import 'package:about_me_upduo/widgets/top_bar_contents_widget.dart';
import 'package:about_me_upduo/widgets/top_text_and_yellow_circle_avatar_widget.dart';
import 'package:about_me_upduo/widgets/upduo_team_widget.dart';
import 'package:about_me_upduo/widgets/upduo_values_widget.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);

    double opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return Scaffold(
          backgroundColor:
              const Color.fromARGB(255, 208, 205, 205).withOpacity(0.1),
          appBar: isMobile
              ? PreferredSize(
                  preferredSize: const Size(0, 0),
                  child: Container(),
                )
              : PreferredSize(
                  preferredSize: Size(screenSize.width, 100),
                  child: TopBarContentsWidget(opacity: opacity),
                ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                isMobile
                    ? TopBarContentsMobileWidget(opacity: opacity)
                    : Container(),
                const TopTextAndYellowCircleAvatarWidget(),
                FloatingCardWidget(screenSize: screenSize),
                const PhotoCardListWidget(),
                const PhotosCarouselWidget(),
                const UpduoValuesWidget(),
                const UpduoTeamWidget(),
                const ContactInfoWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}