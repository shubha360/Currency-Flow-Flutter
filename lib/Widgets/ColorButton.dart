import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:currencies/Components/Utilities.dart';
import 'package:currencies/Components/Size_Config.dart';

// Used in the conversion screen.

class ColorButton extends StatelessWidget {
  final Function onPressed;

  ColorButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kSecondaryColor,
            border: Border.all(
              color: kPrimaryColor,
              width: SizeConfig.safeBlockHorizontal * 1,
            ),
          ),
          child: FaIcon(
            FontAwesomeIcons.paintRoller,
            color: kPrimaryColor,
            size: SizeConfig.safeBlockHorizontal * 7,
          ),
        ),
      ),
    );
  }
}
