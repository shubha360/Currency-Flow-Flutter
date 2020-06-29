import 'package:flutter/material.dart';
import 'file:///D:/Shubha/Flutter/currencies/lib/Components/Size_Config.dart';
import 'package:currencies/Components/Lists.dart';

// Used in both of currency list screens.

class CurrencyList extends StatelessWidget {
  final Color currencyNameColor;

  CurrencyList({@required this.currencyNameColor});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ListView.builder(
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
                  color: currencyNameColor,
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  letterSpacing: 2,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '${currencyCodeList[index]}',
                    style: TextStyle(
                      color: currencyNameColor.withOpacity(0.5),
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
    );
  }
}
