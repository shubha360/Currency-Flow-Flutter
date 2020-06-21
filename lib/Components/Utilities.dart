import 'package:flutter/material.dart';
import 'Lists.dart';

String output = '';

double preDefinedAmount = 100.00;
double finalResult;

String topSelectedCurrencyName = currencyNameList[6];
String topSelectedCurrencyCode = currencyCodeList[6];
String topSelectedCurrencySymbol = currencySymbolList[6];

String bottomSelectedCurrencyName = currencyNameList[85];
String bottomSelectedCurrencyCode = currencyCodeList[85];
String bottomSelectedCurrencySymbol = currencySymbolList[85];

Color kPrimaryColor = Color(0xFF1A237E);
Color kSecondaryColor = Colors.white; //Color(0xFF84FFFF);
const kCustomFont = 'Bitter';

TextStyle kCurrencyNameStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}

TextStyle kCurrencySymbolStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

TextStyle kCurrencyCodeStyle(Color color) {
  return TextStyle(
    fontSize: 30,
    color: color,
    fontFamily: kCustomFont,
  );
}

ListView kCurrencyListView(
    BuildContext context, Color nameColor, Color codeColor) {
  return ListView.builder(
    padding: EdgeInsets.all(10),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.pop(
            context,
            index,
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          child: RichText(
            text: TextSpan(
              text: '${currencyNameList[index]} ',
              style: TextStyle(
                color: nameColor,
                fontSize: 20,
                letterSpacing: 2,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${currencyCodeList[index]}',
                  style: TextStyle(
                    color: codeColor.withOpacity(0.5),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    itemCount: currencyNameList.length,
  );
}
