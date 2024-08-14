import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Reports/enteries_view.dart';
import 'package:spreadx_web/main.dart';

class TotalVatReportView extends StatelessWidget {
  void Function() onPressedBack;
  TotalVatReportView({required this.onPressedBack, super.key});

  RxString selectedView = RxString("default");

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    var defaultView = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                selectedView("enteries");
              },
              child: Container(
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
              constraints: BoxConstraints(
                  maxHeight:
                      styleSheet.appConfig.getScreenHeight(context) * 0.6),
              padding: styleSheet.DECORATION.PADDING_20,
              decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_5,
                color: styleSheet.COLOR.whiteColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          "VAT on Sales and All Other Outputs",
                          style: styleSheet.TEXT_THEME.fs14Bold
                              .copyWith(color: styleSheet.COLOR.blueColor),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          "Total",
                          style: styleSheet.TEXT_THEME.fs14Medium
                              .copyWith(color: styleSheet.COLOR.blueColor),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          "Total VAT",
                          style: styleSheet.TEXT_THEME.fs14Medium
                              .copyWith(color: styleSheet.COLOR.blueColor),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: styleSheet.COLOR.blueColor,
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "AE Output VAT Expempted",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AE Output VAT 0% - Goods",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AE Output VAT 5% - Goods",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            Text(
                              "Totals",
                              style: styleSheet.TEXT_THEME.fs14Bold,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const Text(
                              "AED 0.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AED 0.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AED 2.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            Text(
                              "AED 2.00",
                              style: styleSheet.TEXT_THEME.fs14Bold,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const Text(
                              "AED 0.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AED 0.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AED 2.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            Text(
                              "AED 2.00",
                              style: styleSheet.TEXT_THEME.fs14Bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          "VAT on Expenses and All Other Outputs",
                          style: styleSheet.TEXT_THEME.fs14Bold
                              .copyWith(color: styleSheet.COLOR.blueColor),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          "Total",
                          style: styleSheet.TEXT_THEME.fs14Medium
                              .copyWith(color: styleSheet.COLOR.blueColor),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          "Total VAT",
                          style: styleSheet.TEXT_THEME.fs14Medium
                              .copyWith(color: styleSheet.COLOR.blueColor),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: styleSheet.COLOR.blueColor,
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "AE Output VAT Expempted",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AE Output VAT 0% - Goods",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AE Output VAT 5% - Goods",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            Text(
                              "Totals",
                              style: styleSheet.TEXT_THEME.fs14Bold,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const Text(
                              "AED 0.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AED 0.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AED 2.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            Text(
                              "AED 2.00",
                              style: styleSheet.TEXT_THEME.fs14Bold,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const Text(
                              "AED 0.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AED 0.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            const Text(
                              "AED 2.00",
                            ),
                            styleSheet.appConfig.addHeight(15),
                            Text(
                              "AED 2.00",
                              style: styleSheet.TEXT_THEME.fs14Bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ).paddingOnly(right: 20, left: 20, bottom: 20, top: 40),
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
        ).paddingAll(20),
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
              onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
        ),
      ],
    );

    return Obx(() {
      if (selectedView.value == "enteries") {
        return EnteriesView(onPressedBack: setDefault);
      } else {
        return defaultView;
      }
    });
  }

  setDefault() => selectedView("default");
}
