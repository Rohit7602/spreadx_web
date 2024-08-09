import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class DrawerReportView extends StatelessWidget {
  void Function() onPressedBack;
  DrawerReportView({required this.onPressedBack, super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              padding: styleSheet.DECORATION.PADDING_20,
              decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_5,
                color: styleSheet.COLOR.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ENTERIES IN/OUT",
                    style: styleSheet.TEXT_THEME.fs12Medium
                        .copyWith(color: styleSheet.COLOR.greyColor),
                  ),
                  Row(
                    children: [
                      Text(
                        "0",
                        style: view.textFontMedium
                            .copyWith(color: styleSheet.COLOR.greyColor),
                      ),
                      styleSheet.appConfig.addWidth(10),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: styleSheet.COLOR.greyColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            styleSheet.appConfig.addHeight(10),
            Container(
              padding: styleSheet.DECORATION.PADDING_20,
              decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_5,
                color: styleSheet.COLOR.whiteColor,
              ),
              child: Wrap(
                runSpacing: 20,
                children: [
                  CustomRow(
                      title: "Start of Drawer",
                      trailing: "28 May 2024 01:57 PM"),
                  CustomRow(title: "Starting Cash", trailing: "AED 0.0"),
                  CustomRow(title: "Cash Sales", trailing: "AED 0.0"),
                  CustomRow(title: "Cash Refunds", trailing: "AED 0.0"),
                  CustomRow(title: "Supplier Payments", trailing: "AED 0.0"),
                  CustomRow(title: "Supplier Refunds", trailing: "AED 0.0"),
                  CustomRow(title: "Paid In", trailing: "AED 0.0"),
                  CustomRow(title: "Paid Out", trailing: "AED 0.0"),
                  CustomRow(title: "Expected in Drawer", trailing: "AED 0.0"),
                  CustomRow(title: "Actual in Drawer", trailing: "AED 0.0"),
                  CustomRow(title: "Difference", trailing: "AED 0.0"),
                  CustomRow(title: "Denominations", trailing: "AED 0.0"),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            PrimaryBtnWithIcon(
                isExpanded: true,
                btnName: "Print",
                onPressed: () {
                  onPressedBack();
                },
                icon: Icons.print),
            styleSheet.appConfig.addWidth(20),
            PrimaryBtnWithIcon(
                isExpanded: true,
                btnName: "Share",
                onPressed: () {
                  onPressedBack();
                },
                icon: Icons.share),
          ],
        )
      ],
    ).paddingOnly(right: 20, left: 20, bottom: 20, top: 40);
  }
}
