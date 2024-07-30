// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class TextButtonView extends StatelessWidget {
  String btnName;
  Function onPressed;
  Color? txtColor;
  TextButtonView(
      {required this.btnName,
      required this.onPressed,
      this.txtColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return TextButton(
        onPressed: () => onPressed(),
        child: Text(
          btnName,
          style: view.textFontMedium
              .copyWith(color: txtColor ?? styleSheet.COLOR.blueColor),
        ));
  }
}
