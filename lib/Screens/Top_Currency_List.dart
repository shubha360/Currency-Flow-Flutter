import 'package:currencies/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:currencies/Components/Utilities.dart';
import 'package:currencies/Components/Lists.dart';

class TopCurrencyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
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
                  horizontal: SizeConfig.safeBlockHorizontal * 6,
                  vertical: SizeConfig.safeBlockVertical * 3,
                ),
                child: RichText(
                  text: TextSpan(
                    text: '${currencyNameList[index]} ',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                      letterSpacing: 2,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${currencyCodeList[index]}',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: currencyNameList.length,
        ),
      ),
    );
  }
}
