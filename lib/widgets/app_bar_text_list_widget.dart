import 'package:about_me_upduo/widgets/top_text_hover_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:routefly/routefly.dart';

class TopBarTextListWidget extends StatelessWidget {
  const TopBarTextListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.sizeOf(context).width < 800;

    return isMobile
        ? Column(
            children: List.generate(
              4,
              (int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TopTextHover(
                    index: index,
                    onTap: () {
                      switch (index) {
                        case 0:
                          Routefly.navigate('/');
                          break;
                        case 1:
                          Routefly.navigate('/');
                          break;
                        case 2:
                          Routefly.navigate('/drives');
                          break;
                        case 3:
                          Routefly.navigate('/topics');
                          break;
                        default:
                          Routefly.navigate('/');
                      }
                    },
                  ),
                );
              },
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TopTextHover(
                    index: index,
                    onTap: () {
                      switch (index) {
                        case 0:
                          Routefly.navigate('/');
                          break;
                        case 1:
                          Routefly.navigate('/');
                          break;
                        case 2:
                          Routefly.navigate('/drives');
                          break;
                        case 3:
                          Routefly.navigate('/topics');
                          break;
                        default:
                          Routefly.navigate('/');
                      }
                    },
                  ),
                );
              },
            ),
          );
  }
}
