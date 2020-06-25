import 'package:currencies/Components/TextContainer.dart';
import 'package:currencies/Utilities.dart';
import 'package:currencies/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _scaffoldKey,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.wb_incandescent,
              color: kPrimaryColor,
              size: SizeConfig.safeBlockHorizontal * 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextContainer(text: 'Not happy with the rates?'),
                TextContainer(
                    text:
                        'Unable to find the currency(s) you\'re looking for?'),
                TextContainer(text: 'Having trouble with any feature?'),
                TextContainer(text: 'Suggestions going through mind?'),
              ],
            ),
            Container(
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
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Clipboard.setData(ClipboardData(
              text:
                  'https://drive.google.com/drive/folders/1uG-Q6BX_Xah3VOMhTFF1gZj2kvsRdiFL?usp=sharing'));

          final snackBar = SnackBar(
            content: Text('Downloadable link copied to clipboard!'),
            duration: Duration(seconds: 3),
          );
          _scaffoldKey.currentState.showSnackBar(snackBar);
        },
        label: Text('SHARE'),
        icon: Icon(Icons.share),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
