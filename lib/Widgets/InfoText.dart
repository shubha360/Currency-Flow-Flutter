import 'package:currencies/Components/Size_Config.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;

  InfoText({this.firstText, this.secondText, this.thirdText});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$firstText',
            style: TextStyle(
              height: 1.5,
            ),
          ),
          TextSpan(
            text: '\n$secondText',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: '\n$thirdText',
            style: TextStyle(
              letterSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}
