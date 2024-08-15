// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/small_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DayWiseReportView extends StatefulWidget {
  String title;
  void Function() onPressedBack;
  DayWiseReportView(
      {required this.title, required this.onPressedBack, super.key});

  @override
  State<DayWiseReportView> createState() => _DayWiseReportViewState();
}

class _DayWiseReportViewState extends State<DayWiseReportView> {
  String dateTime = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 1,
                child: Column(
                  children: [
                    if (widget.title == "Custom")
                      SmallButtonView(
                        btnName: "Select Duration",
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return CustomHeaderDialog(
                                  title: "Select Date",
                                  child: SfDateRangePicker(
                                    onCancel: () => Navigator.of(context).pop(),
                                    onSubmit: (val) {
                                      Navigator.of(context).pop(
                                          "${(val as PickerDateRange).startDate.toString().split(" ").first} - ${(val).endDate.toString().split(" ").first}");
                                    },
                                    showActionButtons: true,
                                    cancelText: "Cancel",
                                    confirmText: "Apply",
                                    selectionMode:
                                        DateRangePickerSelectionMode.range,
                                  ),
                                );
                              }).then((val) {
                            if (val != null) {
                              dateTime = val;
                              setState(() {});
                            }
                          });
                        },
                      ),
                    styleSheet.appConfig.addHeight(20),
                    GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: LocalData.salesReportViewList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1.5),
                        itemBuilder: (context, i) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: styleSheet.DECORATION.RADIUS_5,
                              color: styleSheet.COLOR.lightGreyColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  i == 0
                                      ? widget.title
                                      : LocalData.salesReportViewList[i].title,
                                  style: styleSheet.TEXT_THEME.fs14Bold
                                      .copyWith(
                                          color: styleSheet.COLOR.blackColor),
                                ),
                                styleSheet.appConfig.addHeight(5),
                                Text(
                                  i == 0 &&
                                          widget.title.toLowerCase() == "custom"
                                      ? dateTime
                                      : LocalData
                                          .salesReportViewList[i].description,
                                  style: styleSheet.TEXT_THEME.fs14Medium,
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                )),
            styleSheet.appConfig.addWidth(10),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Products",
                    style: styleSheet.TEXT_THEME.fs14Bold
                        .copyWith(color: styleSheet.COLOR.primaryColor),
                  ),
                  styleSheet.appConfig.addHeight(20),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, i) =>
                        styleSheet.appConfig.addHeight(10),
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: styleSheet.DECORATION.PADDING_10,
                        decoration: BoxDecoration(
                            color: styleSheet.COLOR.lightGreyColor,
                            borderRadius: styleSheet.DECORATION.RADIUS_5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: styleSheet
                                          .COLOR.productCardGreyColor),
                                  child: Text(
                                    "640 x 36",
                                    style: styleSheet.TEXT_THEME.fs14Medium
                                        .copyWith(
                                            color: styleSheet.COLOR.greyColor),
                                  ),
                                ),
                                styleSheet.appConfig.addWidth(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("default",
                                        style:
                                            styleSheet.TEXT_THEME.fs14Medium),
                                    styleSheet.appConfig.addHeight(6),
                                    Text("Quantity: 5",
                                        style: styleSheet.TEXT_THEME.fs12Medium
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.greyColor)),
                                  ],
                                ),
                              ],
                            ),
                            Text("AED: 0.00",
                                style: styleSheet.TEXT_THEME.fs14Medium),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            styleSheet.appConfig.addWidth(20),
          ],
        ).paddingOnly(right: 15, left: 15, bottom: 20, top: 40),
        IconButton(
            onPressed: widget.onPressedBack, icon: const Icon(Icons.arrow_back))
      ],
    );
  }
}
