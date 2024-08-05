import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

import '../../keyboard_handler.dart';

class ProductCheckDialog extends StatelessWidget {
  const ProductCheckDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Product Check",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                  flex: 3,
                  child: PrimaryTextFormField(
                    hinttext: "Barcode",
                    onTap: () => openVirtualKeyboard(),
                  )),
              styleSheet.appConfig.addWidth(15),
              PrimaryBtnView(
                btnName: "Search",
                onPressed: () {},
              )
            ],
          ),
          styleSheet.appConfig.addHeight(30),
          Text(
            "Scan product or enter barcode manually",
            style: styleSheet.TEXT_THEME.fs12Normal
                .copyWith(color: styleSheet.COLOR.greyColor),
          ),
          styleSheet.appConfig.addHeight(30),
        ],
      ),
    );
  }
}
