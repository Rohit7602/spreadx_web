import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class UpdateItemQuantityDialog extends StatelessWidget {
  const UpdateItemQuantityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Update Item Quantity",
      child: SizedBox(
        height: styleSheet.appConfig.getScreenHeight(context) * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Flexible(
                    flex: 3,
                    child: PrimaryTextFormField(
                      hinttext: "Barcode",
                    )),
                styleSheet.appConfig.addWidth(20),
                Flexible(
                    flex: 1,
                    child: PrimaryBtnView(btnName: "Search", onPressed: () {}))
              ],
            ),
            styleSheet.appConfig.addHeight(30),
            Text(
              "Scan product or enter barcode manually",
              style: styleSheet.TEXT_THEME.fs12Normal,
            ),
            styleSheet.appConfig.addHeight(30),
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
                      Navigator.of(context).pop();
                    }),
              ],
            ).paddingOnly(bottom: 20, right: 10),
          ],
        ),
      ),
    );
  }
}
