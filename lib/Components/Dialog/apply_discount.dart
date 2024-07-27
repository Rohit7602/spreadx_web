import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class ApplyDiscountDialog extends StatelessWidget {
  const ApplyDiscountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Apply Discount",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: styleSheet.DECORATION.PADDING_10,
            width: styleSheet.appConfig.getScreenWidth(context),
            decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_10,
                color: styleSheet.COLOR.lightGreyColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total",
                  style: styleSheet.TEXT_THEME.fs16Bold,
                ),
                styleSheet.appConfig.addHeight(6),
                Text(
                  "AED 0.0",
                  style: styleSheet.TEXT_THEME.fs14Medium,
                ),
              ],
            ),
          ),
          styleSheet.appConfig.addHeight(20),
          Text(
            "Discount",
            style: styleSheet.TEXT_THEME.fs16Bold,
          ),
          styleSheet.appConfig.addHeight(12),
          Row(
            children: [
              const Expanded(
                child: PrimaryTextFormField(
                  hinttext: "0.0",
                  suffixicon: Icon(Icons.percent_sharp),
                ),
              ),
              styleSheet.appConfig.addWidth(20),
              const Expanded(
                child: PrimaryTextFormField(
                  hinttext: "0.0",
                ),
              ),
            ],
          ),
          styleSheet.appConfig.addHeight(20),
          Container(
            padding: styleSheet.DECORATION.PADDING_10,
            width: styleSheet.appConfig.getScreenWidth(context),
            decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_10,
                color: styleSheet.COLOR.primaryColor.withOpacity(0.1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New Total",
                  style: styleSheet.TEXT_THEME.fs12Medium,
                ),
                Text(
                  "AED 0.0",
                  style: styleSheet.TEXT_THEME.fs16Bold,
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(20),
    );
  }
}
