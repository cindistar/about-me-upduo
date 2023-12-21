import 'package:about_me_upduo/widgets/app_bar_text_list_widget.dart';
import 'package:flutter/material.dart';

class TopBarContentsWidget extends StatefulWidget {
  final double opacity;
  const TopBarContentsWidget({
    super.key,
    required this.opacity,
  });

  @override
  State<TopBarContentsWidget> createState() => _TopBarContentsWidgetState();
}

class _TopBarContentsWidgetState extends State<TopBarContentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[300]?.withOpacity(widget.opacity),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TopBarTextListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
