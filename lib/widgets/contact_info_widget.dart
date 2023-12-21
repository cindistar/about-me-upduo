import 'package:about_me_upduo/widgets/bottom_bar_column_widget.dart';
import 'package:about_me_upduo/widgets/info_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    Key? key,
  }) : super(key: key);

  static const Color gradientStartColor = Color.fromARGB(255, 32, 77, 191);
  static const Color gradientEndColor = Color.fromARGB(255, 5, 136, 230);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 800;

    const emailText = 'Email';
    const emailCindiText = 'cindi_nishi@hotmail.com';
    const linkedinText = 'LinkedIn';
    const linkedinUrlText = 'https://www.linkedin.com/in/cindinishimoto/';
    const gitHubText = 'GitHub';
    const gitHubUrlText = 'https://github.com/cindistar';
    const copyRightText = 'Copyright © 2023 | Cindi Nishimoto <(^_^<)';
    const flutterText = 'FLUTTER';
    const pythonText = 'PYTHON';
    const cSharpText = 'C#';
    const techText = 'Tech';
    const isText = 'is';
    const everythingText = 'everything';
    const popText = 'pop';
    const flutterEmoji = '🐦';
    const cSharpEmoji = '💻';
    const pythonEmoji = '🐍';

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: FractionalOffset(0.2, 0.2),
              end: FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        padding: const EdgeInsets.all(30),
        child: isMobile
            ? Column(
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BottomBarColumnWidget(
                          heading: flutterText,
                          s1: flutterEmoji,
                          s2: techText,
                          s3: techText),
                      BottomBarColumnWidget(
                        heading: cSharpText,
                        s1: cSharpEmoji,
                        s2: isText,
                        s3: isText,
                      ),
                      BottomBarColumnWidget(
                        heading: pythonText,
                        s1: pythonEmoji,
                        s2: popText,
                        s3: everythingText,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () async {
                          sendEmail();
                        },
                        child: const InfoTextWidget(
                          type: emailText,
                          text: emailCindiText,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          goToLinkedIn();
                        },
                        child: const InfoTextWidget(
                          type: linkedinText,
                          text: linkedinUrlText,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          goToGitHub();
                        },
                        child: const InfoTextWidget(
                          type: gitHubText,
                          text: gitHubUrlText,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const BottomBarColumnWidget(
                        heading: flutterText,
                        s1: flutterEmoji,
                        s2: techText,
                        s3: techText,
                      ),
                      const BottomBarColumnWidget(
                        heading: cSharpText,
                        s1: cSharpEmoji,
                        s2: isText,
                        s3: isText,
                      ),
                      const BottomBarColumnWidget(
                        heading: pythonText,
                        s1: pythonEmoji,
                        s2: popText,
                        s3: everythingText,
                      ),
                      Container(
                        color: Colors.white,
                        width: 2,
                        height: 150,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              sendEmail();
                            },
                            child: const InfoTextWidget(
                              type: emailText,
                              text: emailCindiText,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextButton(
                            onPressed: () {
                              goToLinkedIn();
                            },
                            child: const InfoTextWidget(
                              type: linkedinText,
                              text: linkedinUrlText,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextButton(
                            onPressed: () {
                              goToGitHub();
                            },
                            child: const InfoTextWidget(
                              type: gitHubText,
                              text: gitHubUrlText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    copyRightText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void sendEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'cindi_nishi@hotmail.com',
      query: 'subject=Reportar&body=Hi Cindi! ',
    );
    String url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Could not launch $url');
    }
  }

  void goToLinkedIn() async {
    const url = 'https://www.linkedin.com/in/cindinishimoto/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void goToGitHub() async {
    const url = 'https://github.com/cindistar';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
