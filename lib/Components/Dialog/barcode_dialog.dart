import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/keyboard_component.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class BarcodeDialog extends StatefulWidget {
  String hintText;
  BarcodeDialog({required this.hintText, super.key});

  @override
  State<BarcodeDialog> createState() => _BarcodeDialogState();
}

class _BarcodeDialogState extends State<BarcodeDialog> {
  final barcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryTextFormField(
            controller: barcodeController,
            textAlign: TextAlign.center,
            hinttext: widget.hintText,
          ).paddingSymmetric(horizontal: 20),
          KeyboardComponentView(
            onInput: (value) {
              setState(() => barcodeController.text += value);
            },
            onValueRemove: () {
              if (barcodeController.text.isNotEmpty) {
                barcodeController.text = barcodeController.text
                    .substring(0, barcodeController.text.length - 1);
              }
              setState(() {});
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
