import 'file:///D:/Shubha/Flutter/currencies/lib/Components/Utilities.dart';
import 'file:///D:/Shubha/Flutter/currencies/lib/Components/Size_Config.dart';
import 'package:currencies/Widgets/InfoText.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final int errorStatusCode;
  final String requestUrl;

  ErrorScreen({@required this.errorStatusCode, @required this.requestUrl});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Icon(
                          Icons.report,
                          color: Colors.white,
                          size: SizeConfig.safeBlockHorizontal * 30,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                SizeConfig.safeBlockHorizontal * 10,
                                0,
                                SizeConfig.safeBlockHorizontal * 10,
                                SizeConfig.safeBlockVertical * 1.5),
                            child: Text(
                              'Error response code : $errorStatusCode',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 6,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                SizeConfig.safeBlockHorizontal * 10,
                                SizeConfig.safeBlockVertical * 1.5,
                                SizeConfig.safeBlockHorizontal * 10,
                                0),
                            child: Text(
                              'Requested Exchange : $requestUrl',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Sorry for this inconvenience.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.safeBlockHorizontal * 5,
                        SizeConfig.safeBlockVertical * 2,
                        SizeConfig.safeBlockHorizontal * 5,
                        SizeConfig.safeBlockVertical * 2),
                    child: InfoText(
                      firstText:
                          'Please contact the developer regarding this inconvenience. The most effective and easiest way of doing this is taking a screenshot and then mailing it to',
                      secondText: 'development.ionosphere@gmail.com',
                      thirdText: 'Thanks for your patience.',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
