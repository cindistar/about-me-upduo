import 'package:flutter/material.dart';

class InfoTextWidget extends StatelessWidget {
  final String type;
  final String text;

  const InfoTextWidget({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
