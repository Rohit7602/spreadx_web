import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';

class CustomItemDialog extends StatelessWidget {
  const CustomItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Custom Item",
      child: Column(
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
          styleSheet.appConfig.addHeight(30),
          TextButton.icon(
              icon: const Icon(Icons.movie_edit),
              onPressed: () {},
              label: Text(
                "Custom Item",
                style: styleSheet.TEXT_THEME.fs12Normal,
              )),
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
              return KeyboardButtonView(btnName: btn.btnName, onPressed: () {});
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
