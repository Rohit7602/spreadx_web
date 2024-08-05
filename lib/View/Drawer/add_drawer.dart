import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class AddDrawerView extends StatefulWidget {
  const AddDrawerView({super.key});

  @override
  State<AddDrawerView> createState() => _AddDrawerViewState();
}

class _AddDrawerViewState extends State<AddDrawerView> {
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
    return Scaffold(
      appBar: CustomAppbarView(title: "Add Drawer Entry"),
      body: Container(
        padding: styleSheet.DECORATION.PADDING_20,
        decoration: BoxDecoration(
          borderRadius: styleSheet.DECORATION.RADIUS_10,
          color: styleSheet.COLOR.whiteColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: PrimaryTextFormField(
                    title: "Description",
                    hinttext: "Enter Description",
                  ),
                ),
                styleSheet.appConfig.addWidth(10),
                Flexible(
                  flex: 1,
                  child: PrimaryTextFormField(
                    title: "Amount",
                    hinttext: "Enter Amount",
                  ),
                ),
              ],
            ),
            styleSheet.appConfig.addHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "TYPE",
                  style: styleSheet.TEXT_THEME.fs16Normal,
                ).paddingOnly(bottom: 10),
              ],
            ),
            PrimaryDropDown(
                isExpanded: true,
                dropdownValue: selectedType,
                items: listOfTypes,
                value: (val) {
                  selectedType = val!;
                  setState(() {});
                }),
            styleSheet.appConfig.addHeight(10),
          ],
        ),
      ),
    );
  }
}
