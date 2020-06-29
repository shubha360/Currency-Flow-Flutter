import 'package:flutter/material.dart';
import 'package:currencies/Components/Lists.dart';
import 'Size_Config.dart';

String output = 'Fetching data';

double preDefinedAmount = 100.00;
double finalResult;

// Pre selected currency info for top part
String topSelectedCurrencyName = currencyNameList[6];
String topSelectedCurrencyCode = currencyCodeList[6];
String topSelectedCurrencySymbol = currencySymbolList[6];

// Pre selected currency info for bottom part
String bottomSelectedCurrencyName = currencyNameList[85];
String bottomSelectedCurrencyCode = currencyCodeList[85];
String bottomSelectedCurrencySymbol = currencySymbolList[85];

Color kPrimaryColor = Color(0xFF1A237E);
Color kSecondaryColor = Colors.white;
const kCustomFont = 'Bitter';

final kCurrencyNameStyle = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.safeBlockHorizontal * 8,
  fontWeight: FontWeight.bold,
);

final kCurrencyCodeStyle = TextStyle(
  fontSize: SizeConfig.safeBlockHorizontal * 8,
  color: Colors.black,
  fontFamily: kCustomFont,
);

final kCurrencySymbolStyle = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.safeBlockHorizontal * 6,
  fontWeight: FontWeight.bold,
);
