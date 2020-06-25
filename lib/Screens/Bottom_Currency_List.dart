import 'package:currencies/Components/CurrencyList.dart';
import 'package:flutter/material.dart';
import 'package:currencies/Utilities.dart';

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
