// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class SalesComponentCard extends StatelessWidget {
  final String title, icon, description;
  Function onPressed;
  SalesComponentCard(
      {required this.title,
      required this.description,
      required this.icon,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        padding: view.salesCardPadding,
        constraints: BoxConstraints(
            minWidth: view.salesCardMinWidth,
            minHeight: view.salesCardMinHeight),
        decoration: BoxDecoration(
            // border: Border.all(
            //     color: styleSheet.colors.greyColor.withOpacity(0.4), width: 1),
            color: styleSheet.COLOR.whiteColor,
            boxShadow: styleSheet.DECORATION.secondaryShadow,
            borderRadius: styleSheet.DECORATION.RADIUS_10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: styleSheet.TEXT_THEME.fs14Normal,
                ),
                styleSheet.appConfig.addHeight(5),
                Text(
                  description,
                  style: styleSheet.TEXT_THEME.fs14Bold,
                ),
              ],
            ),
            styleSheet.appConfig.addWidth(50),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: styleSheet.COLOR.greyColor),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                size: view.iconSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
