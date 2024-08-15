import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/small_btn.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Reports/add_vat_entry.dart';
import 'package:spreadx_web/View/Reports/enteries_view.dart';
import 'package:spreadx_web/View/Reports/generate_vat_report.dart';
import 'package:spreadx_web/View/Reports/total_vat_report.dart';
import 'package:spreadx_web/main.dart';

class VatReportView extends StatefulWidget {
  void Function() onPressedBack;
  VatReportView({required this.onPressedBack, super.key});

  @override
  State<VatReportView> createState() => _VatReportViewState();
}

class _VatReportViewState extends State<VatReportView> {
  var drawerController = Get.find<DrawersController>();

  RxString selectedView = RxString("default");

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    var defaultView = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: widget.onPressedBack,
              icon: const Icon(Icons.arrow_back)),
          if (drawerController.drawer
                  .any((val) => val.status != VatModelStatus.Is_New) ||
              drawerController.drawer.isEmpty)
            styleSheet.appConfig.addHeight(20),
          Obx(() {
            return drawerController.drawer
                        .any((val) => val.status != VatModelStatus.Is_New) ||
                    drawerController.drawer.isEmpty
                ? Center(
                    child: SmallButtonView(
                      width: 200,
                      btnName: "Generate New Report",
                      onPressed: () {
                        selectedView("generate");
                      },
                    ),
                  )
                : const SizedBox();
          }),
          Obx(() {
            return ListView.separated(
              reverse: true,
              separatorBuilder: (context, i) =>
                  styleSheet.appConfig.addHeight(10),
              padding: styleSheet.DECORATION.PADDING_20,
              shrinkWrap: true,
              itemCount: drawerController.drawer.length,
              itemBuilder: (context, i) {
                var status = drawerController.drawer[i].status;

                return InkWell(
                  onTap: () {
                    selectedView("drawerreport");
                  },
                  child: Container(
                    padding: styleSheet.DECORATION.PADDING_10,
                    decoration: BoxDecoration(
                      color: status == VatModelStatus.Is_New
                          ? styleSheet.COLOR.greenColor.withOpacity(0.2)
                          : status == VatModelStatus.Sumbmitted
                              ? styleSheet.COLOR.bgLightBlueColor2
                              : styleSheet.COLOR.whiteColor,
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
                                  color: status == VatModelStatus.Is_New
                                      ? styleSheet.COLOR.greenColor
                                      : status == VatModelStatus.Sumbmitted
                                          ? styleSheet.COLOR.primaryColor
                                          : styleSheet.COLOR.greyColor),
                              child: Text(
                                status == VatModelStatus.Is_New
                                    ? "GENERATED"
                                    : status == VatModelStatus.Sumbmitted
                                        ? "SUBMITTED"
                                        : "CLOSED",
                                style: styleSheet.TEXT_THEME.fs14Medium
                                    .copyWith(
                                        color: styleSheet.COLOR.whiteColor),
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
                        drawerController.drawer[i].status ==
                                VatModelStatus.Is_New
                            ? Row(
                                children: [
                                  Expanded(
                                    child: PrimaryBtnView(
                                      btnColor: styleSheet.COLOR.greenColor,
                                      btnName: "ADD ENTRY",
                                      onPressed: () {
                                        selectedView("addEntry");
                                      },
                                    ),
                                  ),
                                  styleSheet.appConfig.addWidth(20),
                                  Expanded(
                                    child: PrimaryBtnView(
                                      btnColor: styleSheet.COLOR.primaryColor,
                                      btnName: "SUBMIT REPORT",
                                      onPressed: () {
                                        drawerController.drawer[i].status =
                                            VatModelStatus.Sumbmitted;
                                        setState(() {});
                                      },
                                    ),
                                  )
                                ],
                              )
                            : drawerController.drawer[i].status ==
                                    VatModelStatus.Sumbmitted
                                ? PrimaryBtnView(
                                    isExpanded: true,
                                    btnColor: styleSheet.COLOR.redColor,
                                    btnName: "CLOSE REPORT",
                                    onPressed: () {
                                      drawerController.drawer[i].status =
                                          VatModelStatus.Closed;
                                      setState(() {});
                                    },
                                  )
                                : const SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );

    return Obx(() {
      if (selectedView.value.toLowerCase() == "generate") {
        return GenerateVatReport(
          onPressedBack: setDefaultView,
        );
      } else if (selectedView.value.toLowerCase() == "addentry") {
        return AddVatEntryView(
          onPressedBack: setDefaultView,
        );
      } else if (selectedView.value.toLowerCase() == "drawerreport") {
        return TotalVatReportView(
          onPressedBack: setDefaultView,
        );
      } else {
        return defaultView;
      }
    });
  }

  setDefaultView() => setState(() {
        selectedView("default");
      });
}
