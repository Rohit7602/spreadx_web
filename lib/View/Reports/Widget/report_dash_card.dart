// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class ReportDashboardCard extends StatelessWidget {
  final String title, icon, description;
  Function onPressed;
  ReportDashboardCard(
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
        constraints: const BoxConstraints(minHeight: 250),
        padding: styleSheet.DECORATION.PADDING_20.copyWith(top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: styleSheet.COLOR.whiteColor,
            boxShadow: styleSheet.DECORATION.secondaryShadow,
            borderRadius: styleSheet.DECORATION.RADIUS_5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title.toUpperCase(),
              style: view.textFontBold_Medium,
            ),
            Text(
              description,
              style: view.textFontNormal
                  .copyWith(color: styleSheet.COLOR.greyColor),
              textAlign: TextAlign.center,
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 30,
              color: styleSheet.COLOR.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
