// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class IconBtnView extends StatelessWidget {
  String icon;
  Function onPressed;
  IconBtnView({required this.icon, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: styleSheet.COLOR.greyColor.withOpacity(0.6),
            image: DecorationImage(image: AssetImage(icon))),
      ),
    );
  }
}
