import 'file:///D:/Shubha/Flutter/currencies/lib/Widgets/CurrencyList.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Shubha/Flutter/currencies/lib/Components/Utilities.dart';

class BottomCurrencyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: CurrencyList(currencyNameColor: kPrimaryColor),
      ),
    );
  }
}
