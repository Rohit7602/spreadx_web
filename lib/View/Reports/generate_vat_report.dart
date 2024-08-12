import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/small_btn.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/Components/Dialog/closing_amount_dialog.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class GenerateVatReport extends StatelessWidget {
  void Function() onPressedBack;
  GenerateVatReport({required this.onPressedBack, super.key});

  final drawerController = Get.find<DrawersController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
        styleSheet.appConfig.addHeight(10),
        Text(
          "VAT REPORT TITLE",
          style: styleSheet.TEXT_THEME.fs10Medium
              .copyWith(color: styleSheet.COLOR.blackColor),
        ),
        SecondaryTextFormField(
          onTap: () => openVirtualKeyboard(),
          hinttext: "Enter vat",
        ),
        styleSheet.appConfig.addHeight(20),
        CustomRow(
          title: "From",
          trailing: DateTime.now().toString(),
        ),
        styleSheet.appConfig.addHeight(5),
        CustomRow(
          title: "To",
          trailing: DateTime.now().toString(),
        ),
        styleSheet.appConfig.addHeight(15),
        Center(
          child: SmallButtonView(
            width: 200,
            btnName: "Select Date Range",
            onPressed: () {},
          ),
        ),
        styleSheet.appConfig.addHeight(15),
        PrimaryBtnView(
            isExpanded: true,
            btnName: "Generate VAT Report",
            onPressed: () {
              // if (drawerController.amount.text.isEmpty) {
              //   showDialog(
              //       context: context,
              //       builder: (context) {
              //         return FieldErrorDialog(
              //           text: "VAT Report is required",
              //         );
              //       });
              // } else {
              drawerController.onSave(context);
              onPressedBack();
              // }
            }),
      ],
    ).paddingAll(20);
  }
}
