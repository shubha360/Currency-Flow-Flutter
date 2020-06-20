import 'package:currencies/Components/Utilities.dart';
import 'package:flutter/material.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                size: 100,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Not happy with the rates?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Unable to find the currency(s) you\'re looking for?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Having trouble with any feature?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Suggestions going through mind?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: RichText(
                  text: TextSpan(
                    text:
                        'As a neophyte developer, it will be great to know about your thoughts. Please drop an email at',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      height: 1.5,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nshubha360@outlook.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '\nwhenever you like.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
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
