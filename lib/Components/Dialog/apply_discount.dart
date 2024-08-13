import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

import '../../keyboard_handler.dart';

class ApplyDiscountDialog extends StatelessWidget {
  const ApplyDiscountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Apply Discount",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: styleSheet.DECORATION.PADDING_10,
            width: styleSheet.appConfig.getScreenWidth(context),
            decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_5,
                color: styleSheet.COLOR.fieldGreyColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total",
                  style: styleSheet.TEXT_THEME.fs10Bold,
                ),
                styleSheet.appConfig.addHeight(4),
                Text(
                  "AED 0.0",
                  style: styleSheet.TEXT_THEME.fs16Bold,
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
              Expanded(
                child: PrimaryTextFormField(
                  hinttext: "0.0",
                  onTap: () => openVirtualKeyboard(),
                  suffixicon: const Icon(Icons.percent_sharp),
                ),
              ),
              styleSheet.appConfig.addWidth(20),
              Expanded(
                child: PrimaryTextFormField(
                  hinttext: "0.0",
                  onTap: () => openVirtualKeyboard(),
                ),
              ),
            ],
          ),
          styleSheet.appConfig.addHeight(20),
          Container(
            padding: styleSheet.DECORATION.PADDING_10,
            width: styleSheet.appConfig.getScreenWidth(context),
            decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_5,
                color: styleSheet.COLOR.discountCardGrenColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New Total",
                  style: styleSheet.TEXT_THEME.fs10Bold,
                ),
                styleSheet.appConfig.addHeight(4),
                Text(
                  "AED 0.0",
                  style: styleSheet.TEXT_THEME.fs16Bold,
                ),
              ],
            ),
          ),
          styleSheet.appConfig.addHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButtonView(
                  txtColor: styleSheet.COLOR.greyColor,
                  btnName: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              styleSheet.appConfig.addWidth(20),
              SecondaryButtonView(
                  btnName: "Apply",
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  }),
            ],
          )
        ],
      ).paddingAll(20),
    );
  }
}
