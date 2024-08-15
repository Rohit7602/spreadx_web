import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/main.dart';

class DataCenterView extends StatefulWidget {
  const DataCenterView({super.key});

  @override
  State<DataCenterView> createState() => _DataCenterViewState();
}

class _DataCenterViewState extends State<DataCenterView> {
  Timer? timer;
  double value = 0;
  int second = 0;

  String loadingText = "Loading Masters..";

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second == 5) {
        timer.cancel();
      } else {
        value += 0.2;
        if (second == 2) {
          loadingText = "Loading Transactions..";
        } else if (second == 4) {
          loadingText = "Data Loaded Successfully.";
        }
      }
      setState(() {
        second++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loadingText,
              style: styleSheet.TEXT_THEME.fs14Medium,
            ),
            styleSheet.appConfig.addHeight(10),
            LinearProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(styleSheet.COLOR.primaryColor),
              value: value,
              backgroundColor: styleSheet.COLOR.lightGreyColor,
            ),
            styleSheet.appConfig.addHeight(20),
            Align(
              alignment: Alignment.center,
              child: PrimaryBtnView(
                borderRadius: 2,
                btnName: "LOAD ALL",
                onPressed: () {
                  value = 0;
                  second = 0;
                  loadingText = "Loading Masters..";
                  setState(() {});
                  startTimer();
                },
              ),
            )
          ],
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: TextButtonView(btnName: "🠔 Finish", onPressed: () {}))
      ],
    ).paddingAll(20);
  }
}
