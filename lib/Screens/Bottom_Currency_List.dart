import 'package:currencies/Components/Utilities.dart';
import 'package:currencies/Widgets/CurrencyList.dart';
import 'package:flutter/material.dart';

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
