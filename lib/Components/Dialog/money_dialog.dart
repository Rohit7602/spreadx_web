// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';

class MoneyDialog extends StatelessWidget {
  MoneyDialog({super.key});

  var moneyList = LocalData.moneyAmountList;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: styleSheet.DECORATION.PADDING_40,
        constraints: BoxConstraints(
            maxHeight: styleSheet.appConfig.getScreenHeight(context) * 0.8),
        width: 400,
        child: Wrap(
          runSpacing: 20,
          spacing: 20,
          children: [
            ...List.generate(moneyList.length, (i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(moneyList[i].amount);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      styleSheet.icons.moneyIconWithoutAmount,
                      width: 60,
                    ),
                    Text(
                      moneyList[i].amount,
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.primaryColor),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
