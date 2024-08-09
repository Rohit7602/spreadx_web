// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class CustomAlertDialog extends StatelessWidget {
  String title;
  Widget child;
  double? maxheight;

  CustomAlertDialog(
      {required this.title, required this.child, this.maxheight, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: styleSheet.DECORATION.RADIUS_20),
      child: Container(
        padding: styleSheet.DECORATION.PADDING_20,
        constraints: BoxConstraints(
            // minHeight: maxheight ?? 350,
            maxHeight: styleSheet.appConfig.getScreenHeight(context) * 0.9),
        width: styleSheet.appConfig.getScreenWidth(context) * 0.4,
        decoration: BoxDecoration(
            borderRadius: styleSheet.DECORATION.RADIUS_20,
            color: styleSheet.COLOR.lightBlueColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title.isNotEmpty)
              Text(
                title,
                style: styleSheet.TEXT_THEME.fs18Medium
                    .copyWith(color: styleSheet.COLOR.blackColor),
              ),
            if (title.isNotEmpty) styleSheet.appConfig.addHeight(10),

            // Widget to add Childs
            Flexible(child: child)
          ],
        ),
      ),
    );
  }
}
