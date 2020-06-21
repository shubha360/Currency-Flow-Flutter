import 'package:currencies/Components/Utilities.dart';
import 'package:currencies/Size_Config.dart';
import 'package:flutter/material.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        leading: BackButton(
          color: kPrimaryColor,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.report,
                color: kPrimaryColor,
                size: SizeConfig.safeBlockHorizontal * 30,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  textContainer('Not happy with the rates?'),
                  textContainer(
                      'Unable to find the currency(s) you\'re looking for?'),
                  textContainer('Having trouble with any feature?'),
                  textContainer('Suggestions going through mind?'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 10,
                ),
                child: RichText(
                  text: TextSpan(
                    text:
                        'As a neophyte developer, it will be great to know about your thoughts. Please drop an email at',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      height: 1.5,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\ndevelopment.ionosphere@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '\nwhenever you like.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container textContainer(String text) {
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
