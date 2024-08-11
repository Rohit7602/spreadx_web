// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/small_btn.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';

class DayWiseReportView extends StatelessWidget {
  String title;
  DayWiseReportView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            flex: 1,
            child: Column(
              children: [
                if (title == "Custom")
                  SmallButtonView(
                    btnName: "Select Duration",
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return DateRangePickerDialog(
                      //           firstDate: DateTime(1950),
                      //           lastDate: DateTime(2050));
                      //     });
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
                                  ? title
                                  : LocalData.salesReportViewList[i].title,
                              style: styleSheet.TEXT_THEME.fs14Bold
                                  .copyWith(color: styleSheet.COLOR.blackColor),
                            ),
                            styleSheet.appConfig.addHeight(5),
                            Text(
                              LocalData.salesReportViewList[i].description,
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
          child: Text(
            "Products",
            style: styleSheet.TEXT_THEME.fs14Bold
                .copyWith(color: styleSheet.COLOR.primaryColor),
          ),
        ),
        styleSheet.appConfig.addWidth(20),
      ],
    ).paddingOnly(right: 15, left: 15, bottom: 20, top: 40);
  }
}
