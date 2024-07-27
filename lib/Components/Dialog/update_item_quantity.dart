import 'package:flutter/material.dart';
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
      child: Column(
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
          const Text("Scan product or enter barcode manually"),
          styleSheet.appConfig.addHeight(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButtonView(
                  btnName: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              TextButtonView(
                  btnName: "Apply",
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          )
        ],
      ),
    );
  }
}
