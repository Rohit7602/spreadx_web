import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/Components/Dialog/closing_amount_dialog.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class AddDrawerView extends StatefulWidget {
  void Function() onPressedBack;
  AddDrawerView({required this.onPressedBack, super.key});

  @override
  State<AddDrawerView> createState() => _AddDrawerViewState();
}

class _AddDrawerViewState extends State<AddDrawerView> {
  var drawerController = Get.find<DrawersController>();

  List<String> listOfTypes = [
    "Customer Sales",
    "Customer Refund",
    "Supplier Payment",
    "Supplier Refund",
    "Other",
  ];
  String selectedType = "Customer Sales";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: widget.onPressedBack,
            icon: const Icon(Icons.arrow_back)),
        Container(
            padding: styleSheet.DECORATION.PADDING_10,
            margin: styleSheet.DECORATION.PADDING_20.copyWith(top: 10),
            decoration: BoxDecoration(
              borderRadius: styleSheet.DECORATION.RADIUS_10,
              color: styleSheet.COLOR.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "DESCRIPTION",
                  style: styleSheet.TEXT_THEME.fs10Medium
                      .copyWith(color: styleSheet.COLOR.blackColor),
                ),
                SecondaryTextFormField(
                  onTap: () => openVirtualKeyboard(),
                  controller: drawerController.description,
                  hinttext: "Description",
                ),
                styleSheet.appConfig.addHeight(15),
                Text(
                  "AMOUNT",
                  style: styleSheet.TEXT_THEME.fs10Medium
                      .copyWith(color: styleSheet.COLOR.blackColor),
                ),
                SecondaryTextFormField(
                  onTap: () => openVirtualKeyboard(),
                  controller: drawerController.amount,
                  hinttext: "0.00",
                ),
                styleSheet.appConfig.addHeight(15),
                Text(
                  "TYPE",
                  style: styleSheet.TEXT_THEME.fs10Medium
                      .copyWith(color: styleSheet.COLOR.blackColor),
                ).paddingOnly(bottom: 10),
                PrimaryDropDown(
                    isExpanded: true,
                    dropdownValue: selectedType,
                    items: listOfTypes,
                    value: (val) {
                      selectedType = val!;
                      setState(() {});
                    }),
                styleSheet.appConfig.addHeight(20),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryBtnView(
                          btnColor: styleSheet.COLOR.greenColor,
                          btnName: "PAID IN",
                          onPressed: () {
                            if (drawerController.description.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return FieldErrorDialog(
                                      text: "Please enter the description",
                                    );
                                  });
                            } else if (drawerController.amount.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return FieldErrorDialog(
                                      text: "Please enter the amount",
                                    );
                                  });
                            } else {
                              widget.onPressedBack();
                            }
                          }),
                    ),
                    styleSheet.appConfig.addWidth(10),
                    Expanded(
                      child: PrimaryBtnView(
                          btnColor: styleSheet.COLOR.redColor,
                          btnName: "PAID OUT",
                          onPressed: () {
                            if (drawerController.description.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return FieldErrorDialog(
                                      text: "Please enter the description",
                                    );
                                  });
                            } else if (drawerController.amount.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return FieldErrorDialog(
                                      text: "Please enter the amount",
                                    );
                                  });
                            } else {
                              widget.onPressedBack();
                            }
                          }),
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}
