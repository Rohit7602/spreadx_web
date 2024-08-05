import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';

class CustomItemDialog extends StatelessWidget {
  CustomItemDialog({super.key});

  final customItemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Custom Item",
      child: ListView(
        shrinkWrap: true,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintStyle: styleSheet.TEXT_THEME.fs18Bold
                    .copyWith(color: styleSheet.COLOR.greyColor),
                border: InputBorder.none,
                hintText: "AED 0.00"),
          ).paddingSymmetric(horizontal: 20),
          TextFormField(
            controller: customItemController,
            style: styleSheet.TEXT_THEME.fs12Medium,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Custom Item",
                hintStyle: styleSheet.TEXT_THEME.fs14Bold
                    .copyWith(color: styleSheet.COLOR.primaryColor),
                border: InputBorder.none),
          ),
          GridView.builder(
            padding: styleSheet.DECORATION.PADDING_20,
            itemCount: LocalData.keyboardBtnList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 10 / 3),
            itemBuilder: (context, i) {
              var btn = LocalData.keyboardBtnList[i];
              return KeyboardButtonView(
                widget: Icon(
                  Icons.backspace,
                  color: styleSheet.COLOR.redColor,
                ),
                index: i,
                btnName: btn.btnName,
                onPressed: () {},
              );
            },
          ),
          styleSheet.appConfig.addHeight(10),
          Row(
            children: [
              Expanded(
                  child:
                      PrimaryBtnView(btnName: "Add To Cart", onPressed: () {})),
            ],
          ).paddingSymmetric(horizontal: 20),
          styleSheet.appConfig.addHeight(10),
        ],
      ),
    );
  }
}
