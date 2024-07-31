// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class KeyboardComponentView extends StatelessWidget {
  Function(String) controller;
  double? aspectRatio;
  KeyboardComponentView(
      {required this.controller, this.aspectRatio, super.key});

  String amountController = "";

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return GridView.builder(
      itemCount: LocalData.keyboardBtnList.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio:
              aspectRatio != null ? aspectRatio! : view.keyboardBtnSize),
      itemBuilder: (context, i) {
        var btn = LocalData.keyboardBtnList[i];
        return KeyboardButtonView(
            widget: Icon(
              Icons.backspace,
              color: styleSheet.COLOR.redColor,
            ),
            index: i,
            btnName: btn.btnName,
            onPressed: () {
              if (i == 11) {
                if (amountController.isNotEmpty) {
                  amountController = amountController.substring(
                      0, amountController.length - 1);
                  controller(amountController);
                }
              } else {
                amountController += btn.btnName;
                controller(amountController);
              }
            });
      },
    );
  }
}
