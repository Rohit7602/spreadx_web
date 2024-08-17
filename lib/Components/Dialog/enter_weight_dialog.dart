import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class EnterWeightDialog extends StatelessWidget {
  const EnterWeightDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            styleSheet.appConfig.addHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter Weight",
                  style: styleSheet.TEXT_THEME.fs16Bold,
                ),
              ],
            ),
            styleSheet.appConfig.addHeight(10),
            SecondaryTextFormField(
              allowNumbers: true,
              onTap: () => openVirtualKeyboard(),
              hinttext: "Weight",
            ),
            styleSheet.appConfig.addHeight(30),
            PrimaryBtnView(
                isExpanded: true,
                btnName: "Submit",
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ));
  }
}
