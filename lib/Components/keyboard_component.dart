// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/custom_grid.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';

class KeyboardComponentView extends StatelessWidget {
  void Function(String value) onInput;
  void Function() onValueRemove;
  KeyboardComponentView(
      {required this.onInput, required this.onValueRemove, super.key});

  String amountController = "";

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: LocalData.keyboardBtnList.length,
      shrinkWrap: true,
      gridDelegate: CustomSliverGridDelegate(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemHeight: 70),
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
                onValueRemove();
              } else {
                amountController += btn.btnName;
                onInput(btn.btnName);
              }
            });
      },
    );
  }
}
