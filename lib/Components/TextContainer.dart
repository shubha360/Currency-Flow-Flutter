import 'package:flutter/material.dart';

import '../Size_Config.dart';

// Used in information screen.

class TextContainer extends StatelessWidget {
  final String text;

  TextContainer({@required this.text});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.black,
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          letterSpacing: 1,
        ),
        textAlign: TextAlign.left,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 10,
        vertical: SizeConfig.safeBlockVertical * 1,
      ),
    );
  }
}
