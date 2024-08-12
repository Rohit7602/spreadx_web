// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Sales/day_wise_report.dart';
import 'package:spreadx_web/main.dart';

class SalesReportView extends StatefulWidget {
  void Function() onPressedBack;
  SalesReportView({required this.onPressedBack, super.key});

  @override
  State<SalesReportView> createState() => _SalesReportViewState();
}

class _SalesReportViewState extends State<SalesReportView> {
  bool salesReportView = false;
  String salesType = "";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (salesReportView) {
        return DayWiseReportView(
          title: salesType,
          onPressedBack: () {
            salesReportView = false;
            setState(() {});
          },
        );
      } else {
        return Stack(
          alignment: Alignment.topLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        styleSheet.images.salesReport,
                        width:
                            styleSheet.appConfig.getScreenWidth(context) * 0.4,
                      ),
                      Text(
                        "Manage and view sales reports, monitor products sales progress",
                        style: styleSheet.TEXT_THEME.fs12Medium,
                      )
                    ],
                  ),
                ),
                styleSheet.appConfig.addWidth(20),
                Flexible(
                    flex: 1,
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: LocalData.salesReportList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 16 / 9),
                        itemBuilder: (context, i) {
                          return InkWell(
                            borderRadius: styleSheet.DECORATION.RADIUS_10,
                            onTap: () {
                              salesType = LocalData.salesReportList[i].title;
                              salesReportView = true;
                              setState(() {});
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      styleSheet.DECORATION.RADIUS_10),
                              color: styleSheet.COLOR.bgColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(LocalData.salesReportList[i].title),
                                  styleSheet.appConfig.addHeight(5),
                                  Text(
                                    "AED 0.00",
                                    style: styleSheet.TEXT_THEME.fs14Bold,
                                  ),
                                  styleSheet.appConfig.addHeight(10),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                    color: styleSheet.COLOR.greyColor,
                                  )
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ).paddingSymmetric(horizontal: 15, vertical: 20),
            IconButton(
                onPressed: widget.onPressedBack, icon: Icon(Icons.arrow_back))
          ],
        );
      }
    });
  }
}
