import 'package:flutter/material.dart';
import 'file:///D:/Shubha/Flutter/currencies/lib/Components/Utilities.dart';
import 'file:///D:/Shubha/Flutter/currencies/lib/Widgets/CurrencyList.dart';

class TopCurrencyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: CurrencyList(currencyNameColor: kSecondaryColor),
      ),
    );
  }
}
