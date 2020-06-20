import 'package:currencies/Components/Data_Fetching.dart';
import 'package:currencies/Screens/Bottom_Currency_List.dart';
import 'package:currencies/Screens/Information_Screen.dart';
import 'Top_Currency_List.dart';
import 'package:flutter/material.dart';
import 'package:currencies/Components/Lists.dart';
import 'package:currencies/Components/Utilities.dart';
import 'package:page_transition/page_transition.dart' as transition;

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
    String amountToString = preDefinedAmount.toString();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
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
                            topSelectedCurrencyName = currencyNameList[index];
                            topSelectedCurrencyCode = currencyCodeList[index];
                            topSelectedCurrencySymbol =
                                currencySymbolList[index];
                          });
                          updateUI();
                        }
                      },
                      child: Text(
                        '$topSelectedCurrencyName',
                        style: kCurrencyNameStyle(Colors.white),
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
                                  ? 20
                                  : amountToString.length == 1
                                      ? 50
                                      : amountToString.length == 2
                                          ? 100
                                          : amountToString.length == 3
                                              ? 140
                                              : amountToString.length == 4
                                                  ? 185
                                                  : amountToString.length == 5
                                                      ? 230
                                                      : 280,
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
                                  fontSize: 80,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: '$preDefinedAmount',
                                  hintMaxLines: 1,
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                maxLength: 6,
                                maxLengthEnforced: true,
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Text(
                              '$topSelectedCurrencySymbol',
                              style: kCurrencySymbolStyle(Colors.white),
                            )
                          ],
                        ),
                        Text(
                          '$topSelectedCurrencyCode',
                          style: kCurrencyCodeStyle(Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
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
                        style: kCurrencyNameStyle(kPrimaryColor),
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
                                      ? 80
                                      : output.length < 11
                                          ? 60
                                          : output.length < 16 ? 40 : 20,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InformationScreen(),
                                  ),
                                );
                              },
                            ),
                            Text(
                              '$bottomSelectedCurrencySymbol',
                              style: kCurrencySymbolStyle(kPrimaryColor),
                            )
                          ],
                        ),
                        Text(
                          '$bottomSelectedCurrencyCode',
                          style: kCurrencyCodeStyle(kPrimaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
