// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Drawer/enteries_view.dart';
import 'package:spreadx_web/main.dart';

class DrawerReportView extends StatelessWidget {
  void Function() onPressedBack;
  DrawerReportView({required this.onPressedBack, super.key});

  RxString selectedView = RxString("default");

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    var defaultView = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
            InkWell(
              onTap: () {
                selectedView("drawerEntries");
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20),
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
            ),
            styleSheet.appConfig.addHeight(10),
            Container(
              margin: const EdgeInsets.only(left: 20),
              constraints: BoxConstraints(
                  maxHeight:
                      styleSheet.appConfig.getScreenHeight(context) * 0.6),
              padding: styleSheet.DECORATION.PADDING_20,
              decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_5,
                color: styleSheet.COLOR.whiteColor,
              ),
              child: SingleChildScrollView(
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
                  styleSheet.appConfig.shareNow();
                },
                icon: Icons.share),
          ],
        ).paddingOnly(left: 20)
      ],
    ).paddingOnly(right: 20, left: 0, bottom: 20, top: 0);

    return Obx(() {
      if (selectedView.value == "drawerEntries") {
        return EnteriesDrawerView(
          onPressedBack: () {
            selectedView("default");
          },
        );
      } else {
        return defaultView;
      }
    });
  }
}
