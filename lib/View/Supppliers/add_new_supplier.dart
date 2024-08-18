// ignore_for_file: must_be_immutable

import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Controller/supplier_controller.dart';
import 'package:spreadx_web/Components/Dialog/Widget/alert_dialog.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/phone_text_field.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class AddNewSupplierView extends StatelessWidget {
  final void Function()? onPressedBack;
  AddNewSupplierView({super.key, this.onPressedBack});

  var controller = Get.find<SupplierController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: onPressedBack,
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
          SecondaryTextFormField(
              onTap: () => openVirtualKeyboard(),
              hinttext: "Supplier Name",
              controller: controller.supplierName),
          styleSheet.appConfig.addHeight(20),
          PhoneTextField(
              controller: controller.phoneNumber,
              onValuePick: (Country country) {}),
          styleSheet.appConfig.addHeight(20),
          Obx(() => PrimaryDropDown(
              isExpanded: true,
              border: true,
              hint: "Select Type",
              dropdownValue: controller.type,
              items: const ["Cash", "Credit"],
              value: (v) {
                controller.setType(v!);
              })),
          styleSheet.appConfig.addHeight(20),
          Obx(
            () => controller.type.toLowerCase() == "credit"
                ? Column(
                    children: [
                      SecondaryTextFormField(
                          onTap: () => openVirtualKeyboard(),
                          hinttext: "Credit Limit",
                          controller: controller.creditLimit),
                      styleSheet.appConfig.addHeight(20),
                      SecondaryTextFormField(
                          onTap: () => openVirtualKeyboard(),
                          hinttext: "Days Limit",
                          controller: controller.daysLimit),
                      styleSheet.appConfig.addHeight(30),
                    ],
                  )
                : const SizedBox(),
          ),
          PrimaryBtnView(
              btnName: "Save",
              onPressed: () {
                if (controller.supplierName.text.isNotEmpty) {
                  controller.onSave(context);
                  onPressedBack!();
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                            title: "Alert",
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Add Supplier Name"),
                                styleSheet.appConfig.addHeight(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButtonView(
                                        btnName: "OK",
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                  ],
                                )
                              ],
                            ));
                      });
                }
              },
              isExpanded: true),
        ],
      ).paddingAll(10),
    );
  }
}
