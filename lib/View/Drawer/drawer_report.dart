import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class DrawerReportView extends StatelessWidget {
  const DrawerReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Scaffold(
        appBar: CustomAppbarView(title: "Drawer Report"),
        body: Column(
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
                    style: view.textFontLargeMedium
                        .copyWith(color: styleSheet.COLOR.greyColor),
                  ),
                  Row(
                    children: [
                      Text(
                        "3",
                        style: view.textFontMedium
                            .copyWith(color: styleSheet.COLOR.greyColor),
                      ),
                      styleSheet.appConfig.addWidth(10),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
            styleSheet.appConfig.addHeight(20),
            Container(
              padding: styleSheet.DECORATION.PADDING_20,
              decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_5,
                color: styleSheet.COLOR.whiteColor,
              ),
              child: Wrap(
                runSpacing: 15,
                children: [
                  CustomRow2(
                      title: "Start of Drawer",
                      trailing: "28 May 2024 01:57 PM"),
                  CustomRow2(title: "Starting Cash", trailing: "AED 89.0"),
                  CustomRow2(title: "Cash Sales", trailing: "AED 89.0"),
                  CustomRow2(title: "Cash Refunds", trailing: "AED 89.0"),
                  CustomRow2(title: "Supplier Payments", trailing: "AED 89.0"),
                  CustomRow2(title: "Supplier Refunds", trailing: "AED 89.0"),
                  CustomRow2(title: "Paid In", trailing: "AED 89.0"),
                  CustomRow2(title: "Paid Out", trailing: "AED 89.0"),
                  CustomRow2(title: "Expected in Drawer", trailing: "AED 89.0"),
                  styleSheet.appConfig.addHeight(40),
                  Row(
                    children: [
                      PrimaryBtnWithIcon(
                          btnName: "Share",
                          onPressed: () {},
                          icon: Icons.share),
                      styleSheet.appConfig.addWidth(20),
                      PrimaryBtnWithIcon(
                          btnName: "Print", onPressed: () {}, icon: Icons.print)
                    ],
                  )
                ],
              ),
            )
          ],
        ).paddingAll(20));
  }
}
