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
        padding: styleSheet.DECORATION.PADDING_20.copyWith(top: 0, bottom: 0),
        decoration: BoxDecoration(
            color: styleSheet.COLOR.whiteColor,
            boxShadow: styleSheet.DECORATION.primaryShadow,
            borderRadius: styleSheet.DECORATION.RADIUS_10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 4,
                  child: Row(
                    children: [
                      Image.asset(
                        icon,
                        height: 70,
                        width: 70,
                      ),
                      styleSheet.appConfig.addWidth(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title.toUpperCase(),
                              style: view.textFontBold_Medium,
                            ),
                            styleSheet.appConfig.addHeight(5),
                            Text(
                              description,
                              style: view.textFontNormal,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: view.iconSize,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
