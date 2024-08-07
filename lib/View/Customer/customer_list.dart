// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';

class CustomerListView extends StatelessWidget {
  const CustomerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Customer List",
            style: styleSheet.TEXT_THEME.fs14Bold
                .copyWith(color: styleSheet.COLOR.primaryColor)),
        styleSheet.appConfig.addHeight(10),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          alignment: WrapAlignment.start,
          children: [
            ...List.generate(1, (i) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: styleSheet.DECORATION.RADIUS_10,
                ),
                child: Container(
                  padding: styleSheet.DECORATION.PADDING_10,
                  width: 300,
                  decoration: BoxDecoration(
                    color: styleSheet.COLOR.cardColor,
                    borderRadius: styleSheet.DECORATION.RADIUS_10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: styleSheet.COLOR.productCardGreyColor,
                        ),
                        child: Text(
                          "6 X 6",
                          style: styleSheet.TEXT_THEME.fs12Medium
                              .copyWith(color: styleSheet.COLOR.greyColor),
                        ),
                      ),
                      styleSheet.appConfig.addWidth(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Visitor visitor",
                            style: styleSheet.TEXT_THEME.fs12Bold,
                          ),
                          styleSheet.appConfig.addHeight(6),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                    color: styleSheet.COLOR.blueColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  "unknown",
                                  style: styleSheet.TEXT_THEME.fs10Medium
                                      .copyWith(
                                          color: styleSheet.COLOR.whiteColor),
                                ),
                              ),
                              styleSheet.appConfig.addWidth(5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                    color: styleSheet.COLOR.blueColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  "cash",
                                  style: styleSheet.TEXT_THEME.fs10Medium
                                      .copyWith(
                                          color: styleSheet.COLOR.whiteColor),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ],
        )
      ],
    ).paddingAll(20);
  }
}
