import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/Components/Dialog/closing_amount_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class OpenNewDrawerView extends StatelessWidget {
  final void Function() onPressedBack;
  OpenNewDrawerView({required this.onPressedBack, super.key});

  var drawerController = Get.find<DrawersController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
        Container(
            padding: styleSheet.DECORATION.PADDING_10,
            margin: styleSheet.DECORATION.PADDING_20.copyWith(top: 0),
            decoration: BoxDecoration(
              borderRadius: styleSheet.DECORATION.RADIUS_10,
              color: styleSheet.COLOR.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "OPENING AMOUNT",
                  style: styleSheet.TEXT_THEME.fs10Medium
                      .copyWith(color: styleSheet.COLOR.blackColor),
                ),
                SecondaryTextFormField(
                  onTap: () => openVirtualKeyboard(),
                  controller: drawerController.amount,
                  hinttext: "0.00",
                ),
                styleSheet.appConfig.addHeight(20),
                PrimaryBtnView(
                    isExpanded: true,
                    btnName: "Open New Drawer",
                    onPressed: () {
                      if (drawerController.amount.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return FieldErrorDialog(
                                text: "Actual opening amount is required",
                              );
                            });
                      } else {
                        drawerController.onSave(context);
                        onPressedBack();
                      }
                    }),
              ],
            )),
      ],
    );
  }
}
