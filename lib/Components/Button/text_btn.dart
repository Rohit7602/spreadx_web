// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';

class TextButtonView extends StatelessWidget {
  String btnName;
  Function onPressed;
  TextButtonView({required this.btnName, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return TextButton(
        onPressed: () => onPressed(),
        child: Text(
          btnName,
          style: view.textFontMedium,
        ));
  }
}
