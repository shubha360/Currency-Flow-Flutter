import 'dart:io';
import 'dart:math';
import 'package:currencies/Widgets/ColorButton.dart';
import 'package:currencies/Screens/Bottom_Currency_List.dart';
import 'package:currencies/Screens/Error_Screen.dart';
import 'package:currencies/Screens/Information_Screen.dart';
import 'file:///D:/Shubha/Flutter/currencies/lib/Components/Size_Config.dart';
import 'Top_Currency_List.dart';
import 'package:flutter/material.dart';
import 'package:currencies/Components/Lists.dart';
import 'file:///D:/Shubha/Flutter/currencies/lib/Components/Utilities.dart';
import 'package:page_transition/page_transition.dart' as transition;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConversionScreen extends StatefulWidget {
  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  // To show http error status code in the error screen if response code != 200.
  int httpStatusCode;
  // To show requested currency in the error screen if response code != 200.
  String requestCurrency;

  Future onRequestTimeOut() async {}

  Future<double> requestExchangeRate() async {
    double exchangeRate;

    // Used try-catch block to catch internet connectivity related exception.
    try {
      http.Response response = await http.get(
          'https://free.currconv.com/api/v7/convert?q=${topSelectedCurrencyCode}_$bottomSelectedCurrencyCode&compact=ultra&apiKey=2403a9dd5eeeb59060c2');

      requestCurrency =
          '${topSelectedCurrencyCode}_$bottomSelectedCurrencyCode';

      if (response.statusCode == 200) {
        exchangeRate = double.parse((jsonDecode(response.body)[
                '${topSelectedCurrencyCode}_$bottomSelectedCurrencyCode'])
            .toString());
      } else {
        httpStatusCode = response.statusCode;
        print(httpStatusCode);
        final snackBar = SnackBar(
          content: Text('An unexpected error occurred.'),
          duration: Duration(hours: 24),
          action: SnackBarAction(
              label: 'See details',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ErrorScreen(
                      errorStatusCode: httpStatusCode,
                      requestUrl: requestCurrency,
                    ),
                  ),
                );
              }),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } on SocketException catch (_) {
      final exceptionSnackBar = SnackBar(
        content: Text('Looks like your internet connection is not stable.'),
      );
      Future.delayed(Duration(seconds: 3), () {
        _scaffoldKey.currentState.showSnackBar(exceptionSnackBar);
      });
    }
    return exchangeRate;
  }

  void updateUI() async {
    try {
      double exchangeRate = await requestExchangeRate();

      finalResult = exchangeRate * preDefinedAmount;
      setState(() {
        output = finalResult.toStringAsFixed(2);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  // GlobalKey to show snackbar.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String amountToString = preDefinedAmount.toString();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: kPrimaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            var selectedCurrency = await Navigator.push(
                              context,
                              transition.PageTransition(
                                type: transition.PageTransitionType.rightToLeft,
                                child: TopCurrencyList(),
                              ),
                            );
                            if (selectedCurrency != null) {
                              int index = await selectedCurrency;
                              setState(() {
                                topSelectedCurrencyName =
                                    currencyNameList[index];
                                topSelectedCurrencyCode =
                                    currencyCodeList[index];
                                topSelectedCurrencySymbol =
                                    currencySymbolList[index];
                              });
                              updateUI();
                            }
                          },
                          child: Text(
                            '$topSelectedCurrencyName',
                            style: kCurrencyNameStyle.copyWith(
                                color: kSecondaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Container(
                                  width: amountToString.length == 0
                                      ? SizeConfig.safeBlockHorizontal * 10
                                      : amountToString.length == 1
                                          ? SizeConfig.safeBlockHorizontal * 20
                                          : amountToString.length == 2
                                              ? SizeConfig.safeBlockHorizontal *
                                                  30
                                              : amountToString.length == 3
                                                  ? SizeConfig
                                                          .safeBlockHorizontal *
                                                      40
                                                  : amountToString.length == 4
                                                      ? SizeConfig
                                                              .safeBlockHorizontal *
                                                          50
                                                      : amountToString.length ==
                                                              5
                                                          ? SizeConfig
                                                                  .safeBlockHorizontal *
                                                              60
                                                          : SizeConfig
                                                                  .safeBlockHorizontal *
                                                              70,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        preDefinedAmount = double.parse(value);
                                      });
                                    },
                                    onSubmitted: (value) {
                                      preDefinedAmount = double.parse(value);
                                      updateUI();
                                    },
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 20,
                                      color: kSecondaryColor,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: '$preDefinedAmount',
                                      hintMaxLines: 1,
                                      hintStyle: TextStyle(
                                        color: kSecondaryColor,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    maxLength: 6,
                                    maxLengthEnforced: true,
                                    cursorColor: kSecondaryColor,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                Text(
                                  '$topSelectedCurrencySymbol',
                                  style: kCurrencySymbolStyle.copyWith(
                                      color: kSecondaryColor),
                                )
                              ],
                            ),
                            Text(
                              '$topSelectedCurrencyCode',
                              style: kCurrencyCodeStyle.copyWith(
                                  color: kSecondaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            var selectedCurrency = await Navigator.push(
                              context,
                              transition.PageTransition(
                                type: transition.PageTransitionType.rightToLeft,
                                child: BottomCurrencyList(),
                              ),
                            );
                            if (selectedCurrency != null) {
                              int index = await selectedCurrency;
                              setState(() {
                                bottomSelectedCurrencyName =
                                    currencyNameList[index];
                                bottomSelectedCurrencyCode =
                                    currencyCodeList[index];
                                bottomSelectedCurrencySymbol =
                                    currencySymbolList[index];
                              });
                              updateUI();
                            }
                          },
                          child: Text(
                            '$bottomSelectedCurrencyName',
                            style: kCurrencyNameStyle.copyWith(
                                color: kPrimaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                GestureDetector(
                                  child: Text(
                                    '$output',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: output.length < 9
                                          ? SizeConfig.safeBlockHorizontal * 20
                                          : output.length < 11
                                              ? SizeConfig.safeBlockHorizontal *
                                                  15
                                              : output.length < 16
                                                  ? SizeConfig
                                                          .safeBlockHorizontal *
                                                      12
                                                  : SizeConfig
                                                          .safeBlockHorizontal *
                                                      8,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InformationScreen(),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  '$bottomSelectedCurrencySymbol',
                                  style: kCurrencySymbolStyle.copyWith(
                                      color: kPrimaryColor),
                                )
                              ],
                            ),
                            Text(
                              '$bottomSelectedCurrencyCode',
                              style: kCurrencyCodeStyle.copyWith(
                                  color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            ColorButton(
              onPressed: () {
                setState(() {
                  kPrimaryColor = Colors
                      .primaries[Random().nextInt(Colors.primaries.length)];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
