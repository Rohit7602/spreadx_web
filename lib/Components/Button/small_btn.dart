import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class SmallButtonView extends StatelessWidget {
  String btnName;
  Function onPressed;
  double? width;
  SmallButtonView(
      {required this.btnName, required this.onPressed, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(styleSheet.COLOR.primaryColor),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: styleSheet.DECORATION.RADIUS_20,
          )),
          fixedSize: WidgetStateProperty.all(Size(width ?? 160, 40))),
      onPressed: () => onPressed(),
      child: Text(btnName),
    );
  }
}
