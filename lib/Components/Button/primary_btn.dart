// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class PrimaryBtnView extends StatelessWidget {
  String btnName;
  Function onPressed;
  Color? btnColor;
  Color? txtColor;
  double? borderRadius;
  bool isExpanded;

  PrimaryBtnView(
      {required this.btnName,
      required this.onPressed,
      this.btnColor,
      this.txtColor,
      this.borderRadius,
      this.isExpanded = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    var btn = ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 2))),
        minimumSize: WidgetStateProperty.all(
            Size(MediaQuery.of(context).size.width * 0.2, 40)),
        backgroundColor: WidgetStateProperty.all<Color>(
            btnColor ?? styleSheet.COLOR.primaryColor),
      ),
      onPressed: () => onPressed(),
      child: Text(
        btnName,
        style: view.textFontMedium
            .copyWith(color: txtColor ?? styleSheet.COLOR.whiteColor),
      ),
    );

    return isExpanded
        ? Row(
            children: [Expanded(child: btn)],
          )
        : btn;
  }
}

class PrimaryBtnWithIcon extends StatelessWidget {
  String btnName;
  Function onPressed;
  Color? btnColor;
  IconData icon;

  PrimaryBtnWithIcon(
      {required this.btnName,
      required this.onPressed,
      this.btnColor,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        minimumSize: WidgetStateProperty.all(
            Size(MediaQuery.of(context).size.width * 0.2, 40)),
        backgroundColor: WidgetStateProperty.all<Color>(
            btnColor ?? styleSheet.COLOR.primaryColor),
      ),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(icon),
          styleSheet.appConfig.addWidth(10),
          Text(
            btnName,
            style: view.textFontMedium
                .copyWith(color: styleSheet.COLOR.whiteColor),
          ),
        ],
      ),
    );
  }
}

class SecondaryButtonView extends StatelessWidget {
  String btnName;
  Function onPressed;
  Color? btnColor;
  Color? txtColor;

  SecondaryButtonView(
      {required this.btnName,
      required this.onPressed,
      this.btnColor,
      this.txtColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(view.secondarBtnMinWidth),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
            btnColor ?? styleSheet.COLOR.primaryColor),
      ),
      onPressed: () => onPressed(),
      child: Text(
        btnName,
        textAlign: TextAlign.center,
        style: styleSheet.TEXT_THEME.fs12Normal
            .copyWith(color: txtColor ?? styleSheet.COLOR.whiteColor),
      ),
    );
  }
}

class OutlineButtonView extends StatelessWidget {
  String btnName;
  Function onPressed;
  Color? btnColor;
  Color? txtColor;

  OutlineButtonView(
      {required this.btnName,
      required this.onPressed,
      this.btnColor,
      this.txtColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return OutlinedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(view.secondarBtnMinWidth),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: styleSheet.COLOR.lightGreyColor),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
            btnColor ?? styleSheet.COLOR.primaryColor),
      ),
      onPressed: () => onPressed(),
      child: Text(
        btnName,
        style: view.textFontNormal
            .copyWith(color: txtColor ?? styleSheet.COLOR.whiteColor),
      ),
    );
  }
}

class KeyboardButtonView extends StatelessWidget {
  String btnName;
  Function onPressed;
  Widget widget;
  int index;

  KeyboardButtonView(
      {required this.btnName,
      required this.onPressed,
      required this.widget,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        minimumSize: WidgetStateProperty.all(view.secondarBtnMinWidth),
        maximumSize: WidgetStateProperty.all(
            Size(styleSheet.appConfig.getScreenWidth(context) * 0.6, 50)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.all<Color>(styleSheet.COLOR.keyboardBtnColor),
      ),
      onPressed: () => onPressed(),
      child: index == 11
          ? widget
          : Text(
              btnName,
              style: styleSheet.TEXT_THEME.fs14Bold
                  .copyWith(color: styleSheet.COLOR.blackColor),
            ),
    );
  }
}
