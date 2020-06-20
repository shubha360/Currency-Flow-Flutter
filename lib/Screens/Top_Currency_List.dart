import 'package:flutter/material.dart';
import 'package:currencies/Components/Utilities.dart';

class TopCurrencyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: kCurrencyListView(context, Colors.white, Colors.white),
      ),
    );
  }
}
