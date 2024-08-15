// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/Components/Dialog/closing_amount_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class CloseDrawerNavigationView extends StatelessWidget {
  DrawerModel drawerModel;
  final void Function() onPressedBack;

  CloseDrawerNavigationView(
      {required this.drawerModel, required this.onPressedBack, super.key});
  final amountController = TextEditingController();

  var drawer = Get.find<DrawersController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
          Container(
            height: styleSheet.appConfig.getScreenHeight(context) - 150,
            padding: styleSheet.DECORATION.PADDING_10,
            margin: styleSheet.DECORATION.PADDING_20.copyWith(top: 10),
            decoration: BoxDecoration(
              borderRadius: styleSheet.DECORATION.RADIUS_10,
              color: styleSheet.COLOR.whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ACTUAL IN DRAWER",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    SecondaryTextFormField(
                      onTap: () => openVirtualKeyboard(),
                      controller: amountController,
                      hinttext: "0.00",
                    ),
                  ],
                ),
                PrimaryBtnView(
                    btnColor: styleSheet.COLOR.redColor,
                    isExpanded: true,
                    btnName: "Close Navigation Menu",
                    onPressed: () {
                      if (amountController.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return FieldErrorDialog(
                                text: "Actual closing amount is required",
                              );
                            });
                      } else {
                        drawer.addCloseDrawer();
                        drawer.clearDrawer();
                        onPressedBack();
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
