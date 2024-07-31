import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/keyboard_component.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class BarcodeDialog extends StatelessWidget {
  String hintText;
  BarcodeDialog({required this.hintText, super.key});
  final barcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "",
      child: Column(
        children: [
          PrimaryTextFormField(
            controller: barcodeController,
            textAlign: TextAlign.center,
            hinttext: hintText,
          ).paddingSymmetric(horizontal: 20),
          KeyboardComponentView(
            aspectRatio: 12 / 3,
            controller: (val) {
              barcodeController.text = val;
            },
          ).paddingAll(20),
          PrimaryBtnView(
              isExpanded: true,
              btnName: "Submit",
              onPressed: () {
                Navigator.of(context).pop(barcodeController.text);
              }).paddingSymmetric(horizontal: 20)
        ],
      ).paddingSymmetric(vertical: 10),
    );
  }
}
