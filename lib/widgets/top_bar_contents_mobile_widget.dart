import 'package:about_me_upduo/widgets/app_bar_text_list_widget.dart';
import 'package:flutter/material.dart';

class TopBarContentsMobileWidget extends StatefulWidget {
  final double opacity;
  const TopBarContentsMobileWidget({
    super.key,
    required this.opacity,
  });

  @override
  State<TopBarContentsMobileWidget> createState() =>
      _TopBarContentsMobileWidgetState();
}

class _TopBarContentsMobileWidgetState
    extends State<TopBarContentsMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TopBarTextListWidget(),
        ],
      ),
    );
  }
}
