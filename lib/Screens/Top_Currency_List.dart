import 'package:flutter/material.dart';
import 'package:currencies/Utilities.dart';
import 'package:currencies/Components/CurrencyList.dart';

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
