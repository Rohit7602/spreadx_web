import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/small_btn.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Reports/generate_vat_report.dart';
import 'package:spreadx_web/main.dart';

class VatReportView extends StatelessWidget {
  VatReportView({super.key});

  var drawerController = Get.find<DrawersController>();

  RxString selectedView = RxString("default");

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    var defaultView = Column(
      children: [
        styleSheet.appConfig.addHeight(20),
        Center(
          child: SmallButtonView(
            width: 200,
            btnName: "Generate New Report",
            onPressed: () {
              selectedView("generate");
            },
          ),
        ),
        Obx(() {
          return ListView.separated(
            separatorBuilder: (context, i) =>
                styleSheet.appConfig.addHeight(10),
            padding: styleSheet.DECORATION.PADDING_20.copyWith(top: 40),
            shrinkWrap: true,
            itemCount: drawerController.drawer.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  selectedView("drawerreport");
                },
                child: Container(
                  padding: styleSheet.DECORATION.PADDING_10,
                  decoration: BoxDecoration(
                    color: styleSheet.COLOR.greenColor.withOpacity(0.2),
                    borderRadius: styleSheet.DECORATION.RADIUS_5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "VAT Report 97790807087 | 9 Enteries",
                            style: view.textFontBold_Medium,
                          ),
                          Container(
                            padding: styleSheet.DECORATION.PADDING_5,
                            decoration: BoxDecoration(
                                borderRadius: styleSheet.DECORATION.RADIUS_5,
                                color: styleSheet.COLOR.greenColor),
                            child: Text(
                              "GENERATED",
                              style: styleSheet.TEXT_THEME.fs14Medium
                                  .copyWith(color: styleSheet.COLOR.whiteColor),
                            ),
                          ),
                        ],
                      ),
                      styleSheet.appConfig.addHeight(10),
                      Row(
                        children: [
                          Icon(
                            Icons.analytics_outlined,
                            color: styleSheet.COLOR.greenColor,
                          ),
                          styleSheet.appConfig.addWidth(10),
                          Text(
                            "Total OUT AED 0.00 | Total IN AED 0.00 | Balance AED 0.00",
                            overflow: TextOverflow.fade,
                            style: view.textFontBold,
                          ),
                        ],
                      ),
                      styleSheet.appConfig.addHeight(10),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: styleSheet.COLOR.greenColor,
                          ),
                          styleSheet.appConfig.addWidth(10),
                          Text(
                            "From [01 Jul 2024] TO [10 Jul 2024]",
                            overflow: TextOverflow.fade,
                            style: view.textFontBold,
                          ),
                        ],
                      ),
                      styleSheet.appConfig.addHeight(10),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_rounded,
                            color: styleSheet.COLOR.greenColor,
                          ),
                          styleSheet.appConfig.addWidth(10),
                          Text(
                            "Generated on 28 May 2024 01:57 PM",
                            overflow: TextOverflow.fade,
                            style: view.textFontBold,
                          ),
                        ],
                      ),
                      styleSheet.appConfig.addHeight(15),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryBtnView(
                              btnColor: styleSheet.COLOR.greenColor,
                              btnName: "ADD ENTRY",
                              onPressed: () {
                                // selectedView("addEntry");
                              },
                            ),
                          ),
                          styleSheet.appConfig.addWidth(20),
                          Expanded(
                            child: PrimaryBtnView(
                              btnColor: styleSheet.COLOR.primaryColor,
                              btnName: "SUBMIT REPORT",
                              onPressed: () {
                                // selectedView("closeNavigation");
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ],
    );

    return Obx(() {
      if (selectedView.value.toLowerCase() == "generate") {
        return GenerateVatReport(
          onPressedBack: setDefaultView,
        );
      } else {
        return defaultView;
      }
    });
  }

  setDefaultView() => selectedView("default");
}
