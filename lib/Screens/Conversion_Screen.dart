import 'dart:math';
import 'package:currencies/Components/Data_Fetching.dart';
import 'package:currencies/Screens/Bottom_Currency_List.dart';
import 'package:currencies/Screens/Information_Screen.dart';
import 'package:currencies/Size_Config.dart';
import 'Top_Currency_List.dart';
import 'package:flutter/material.dart';
import 'package:currencies/Components/Lists.dart';
import 'package:currencies/Components/Utilities.dart';
import 'package:page_transition/page_transition.dart' as transition;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConversionScreen extends StatefulWidget {
  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  void updateUI() async {
    try {
      double exchangeRate = await DataFetcher().requestExchangeRate();

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String amountToString = preDefinedAmount.toString();

    return Scaffold(
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
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: SizeConfig.safeBlockHorizontal * 8,
                              fontWeight: FontWeight.bold,
                            ),
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
                                  style: TextStyle(
                                    color: kSecondaryColor,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 6,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '$topSelectedCurrencyCode',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 8,
                                color: kSecondaryColor,
                                fontFamily: kCustomFont,
                              ),
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
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: SizeConfig.safeBlockHorizontal * 8,
                              fontWeight: FontWeight.bold,
                            ),
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
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 6,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '$bottomSelectedCurrencyCode',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 8,
                                color: kPrimaryColor,
                                fontFamily: kCustomFont,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    kPrimaryColor = Colors
                        .primaries[Random().nextInt(Colors.primaries.length)];
                  });
                },
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
            ),
          ],
        ),
      ),
    );
  }
}
