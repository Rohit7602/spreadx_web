// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Controller/users_controller.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/keyboard_component.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/main.dart';

class PasscodeDialog extends StatefulWidget {
  const PasscodeDialog({super.key});

  @override
  State<PasscodeDialog> createState() => _PasscodeDialogState();
}

class _PasscodeDialogState extends State<PasscodeDialog> {
  final barcodeController = TextEditingController();
  final userController = Get.find<UsersController>().securityPD;

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: barcodeController.text.isNotEmpty &&
                              index < barcodeController.text.length
                          ? styleSheet.COLOR.primaryColor
                          : styleSheet.COLOR.greyColor),
                );
              }),
            ],
          ).paddingSymmetric(vertical: 10),
          styleSheet.appConfig.addHeight(10),
          if (showError)
            Text(
              "Invalid Passcode",
              style: styleSheet.TEXT_THEME.fs14Medium
                  .copyWith(color: styleSheet.COLOR.redColor),
            ),
          KeyboardComponentView(
            onInput: (value) {
              setState(() => barcodeController.text += value);

              if (barcodeController.text.length == 4) {
                if (userController == int.parse(barcodeController.text)) {
                  context.go(MyRoute.mainMenuDrawer);
                } else {
                  setState(() {
                    showError = true;
                  });
                  barcodeController.clear();

                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      showError = false;
                    });
                  });
                  setState(() {});
                }
              }
            },
            onValueRemove: () {
              if (barcodeController.text.isNotEmpty) {
                barcodeController.text = barcodeController.text
                    .substring(0, barcodeController.text.length - 1);
              }
              setState(() {});
            },
          ).paddingAll(20),
        ],
      ).paddingSymmetric(vertical: 10),
    );
  }
}
