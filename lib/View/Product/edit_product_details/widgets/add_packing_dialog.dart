import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class AddPackingDialog extends StatefulWidget {
  final Function(PackingDataModel) ontap;
  const AddPackingDialog({super.key, required this.ontap});

  @override
  State<AddPackingDialog> createState() => _AddPackingDialogState();
}

class _AddPackingDialogState extends State<AddPackingDialog> {
  final TextEditingController unitCode = TextEditingController();
  final TextEditingController unitName = TextEditingController();
  final TextEditingController unitEquivalent = TextEditingController();
  final RxBool allowFraction = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "",
        child: Padding(
          padding: styleSheet.DECORATION.PADDING_20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add New Unit", style: styleSheet.TEXT_THEME.fs16Bold),
              styleSheet.appConfig.addHeight(40),
              SecondaryTextFormField(
                  controller: unitCode,
                  onTap: () => openVirtualKeyboard(),
                  hinttext: "Unit Code"),
              styleSheet.appConfig.addHeight(20),
              SecondaryTextFormField(
                  controller: unitName,
                  onTap: () => openVirtualKeyboard(),
                  hinttext: "Unit Name"),
              styleSheet.appConfig.addHeight(20),
              Row(
                children: [
                  Row(
                    children: [
                      Obx(() => Checkbox.adaptive(
                          value: allowFraction.value,
                          onChanged: (v) {
                            allowFraction(v);
                          })),
                      Text("Allow Fraction",
                          style: styleSheet.TEXT_THEME.fs12Bold)
                    ],
                  ),
                  styleSheet.appConfig.addWidth(10),
                  Expanded(
                    child: SecondaryTextFormField(
                        controller: unitEquivalent,
                        onTap: () => openVirtualKeyboard(),
                        hinttext: "Unit Equivalent"),
                  ),
                ],
              ),
              styleSheet.appConfig.addHeight(40),
              PrimaryBtnView(
                  btnName: "Add Unit",
                  onPressed: () {
                    if (unitName.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Please enter the value of Unit Name")));
                    } else {
                      widget.ontap(PackingDataModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          unitCode: unitCode.text.trim(),
                          unitName: unitName.text.trim(),
                          unitEquivalent: unitEquivalent.text.trim()));
                      Navigator.of(context).pop();
                    }
                  },
                  isExpanded: true)
            ],
          ),
        ));
  }
}
