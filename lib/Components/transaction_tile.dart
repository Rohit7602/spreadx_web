import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spreadx_web/main.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  const TransactionTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: styleSheet.COLOR.lightGreyColor,
      child: ListTile(
        leading: Image.asset(styleSheet.icons.saleIcon,
            color: styleSheet.COLOR.greyColor, width: 24),
        title: Text(title, style: styleSheet.TEXT_THEME.fs14Bold),
        subtitle: Text("IN4290003",
            style: styleSheet.TEXT_THEME.fs12Bold
                .copyWith(color: styleSheet.COLOR.greyColor)),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("${title == "Sales" ? "+" : "-"}1.00",
                style: styleSheet.TEXT_THEME.fs14Bold.copyWith(
                    color: title == "Sales"
                        ? styleSheet.COLOR.greenColor
                        : styleSheet.COLOR.redColor)),
            Text(DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
                style: styleSheet.TEXT_THEME.fs12Bold),
          ],
        ),
      ),
    );
  }
}
