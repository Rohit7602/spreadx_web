import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/alert_dialog.dart';
import 'package:spreadx_web/main.dart';

class FieldErrorDialog extends StatelessWidget {
  String text;
  FieldErrorDialog({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Alert",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,
              style: styleSheet.TEXT_THEME.fs12Medium
                  .copyWith(color: styleSheet.COLOR.blackColor)),
          styleSheet.appConfig.addHeight(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButtonView(
                  btnName: "OK",
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          )
        ],
      ),
    );
  }
}
