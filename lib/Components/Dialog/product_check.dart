import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class ProductCheckDialog extends StatelessWidget {
  const ProductCheckDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Product Check",
      child: Column(
        children: [
          Row(
            children: [
              const Flexible(
                  flex: 3,
                  child: PrimaryTextFormField(
                    hinttext: "Barcode",
                  )),
              styleSheet.appConfig.addWidth(15),
              PrimaryBtnView(
                borderRadius: 10,
                btnName: "Search",
                onPressed: () {},
              )
            ],
          ),
          styleSheet.appConfig.addHeight(30),
          Text(
            "Scan product or enter barcode manually",
            style: styleSheet.TEXT_THEME.fs14Medium
                .copyWith(color: styleSheet.COLOR.greyColor),
          ),
          styleSheet.appConfig.addHeight(30),
        ],
      ),
    );
  }
}
