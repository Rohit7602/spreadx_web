// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class CustomRow extends StatelessWidget {
  String title, trailing;
  Color? txtColor;
  CustomRow(
      {required this.title, required this.trailing, this.txtColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: styleSheet.TEXT_THEME.fs12Bold
                .copyWith(color: txtColor ?? styleSheet.COLOR.blackColor)),
        Text(trailing,
            style: styleSheet.TEXT_THEME.fs12Bold
                .copyWith(color: txtColor ?? styleSheet.COLOR.blackColor))
      ],
    );
  }
}

class CustomRow2 extends StatelessWidget {
  String title, trailing;
  CustomRow2({required this.title, required this.trailing, super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: view.textFontLargeMedium
                .copyWith(color: styleSheet.COLOR.greyColor)),
        Text(trailing, style: view.textFontBold)
      ],
    );
  }
}
