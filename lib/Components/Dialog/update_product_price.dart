import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

import '../../keyboard_handler.dart';

class UpdateProductPriceDialog extends StatefulWidget {
  const UpdateProductPriceDialog({super.key});

  @override
  State<UpdateProductPriceDialog> createState() =>
      _UpdateProductPriceDialogState();
}

class _UpdateProductPriceDialogState extends State<UpdateProductPriceDialog> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Update Product Price",
      child: SizedBox(
        height: styleSheet.appConfig.getScreenHeight(context) * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: PrimaryTextFormField(
                      hinttext: "Barcode",
                      onTap: () => openVirtualKeyboard(),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Switch.adaptive(
                      activeColor: styleSheet.COLOR.greyColor,
                      thumbColor:
                          WidgetStateProperty.all(styleSheet.COLOR.blackColor),
                      value: _value,
                      onChanged: (newValue) =>
                          setState(() => _value = newValue),
                    ),
                    Text(
                      "Keep Open after apply",
                      style: styleSheet.TEXT_THEME.fs12Normal,
                    )
                  ],
                ),
                Row(
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
                )
              ],
            ).paddingOnly(bottom: 20, right: 10),
          ],
        ),
      ),
    );
  }
}
