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
        text: '$firstText',
        style: TextStyle(
          color: Colors.black,
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          height: 1.5,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '\n$secondText',
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: '\n$thirdText',
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              letterSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}
