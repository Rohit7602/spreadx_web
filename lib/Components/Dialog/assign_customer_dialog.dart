import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class AssignCustomerDialog extends StatefulWidget {
  const AssignCustomerDialog({super.key});

  @override
  State<AssignCustomerDialog> createState() => _AssignCustomerDialogState();
}

class _AssignCustomerDialogState extends State<AssignCustomerDialog> {
  int selectedValue = 0;
  bool isNewCustomer = false;

  List<String> listOfTypes = ["Individual", "Business"];
  String selectedType = "Individual";
  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Add Customer",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (isNewCustomer) isNewCustomer = false;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                      color: isNewCustomer
                          ? styleSheet.COLOR.blueColor.withOpacity(0.1)
                          : styleSheet.COLOR.primaryColor,
                      borderRadius: styleSheet.DECORATION.RADIUS_5.copyWith(
                        topRight: const Radius.circular(0),
                        bottomRight: const Radius.circular(0),
                      ),
                    ),
                    child: Text(
                      "Existing Customer",
                      style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
                        color: isNewCustomer
                            ? styleSheet.COLOR.blackColor
                            : styleSheet.COLOR.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (!isNewCustomer) isNewCustomer = true;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                      color: isNewCustomer
                          ? styleSheet.COLOR.primaryColor
                          : styleSheet.COLOR.blueColor.withOpacity(0.1),
                      borderRadius: styleSheet.DECORATION.RADIUS_5.copyWith(
                        topLeft: const Radius.circular(0),
                        bottomLeft: const Radius.circular(0),
                      ),
                    ),
                    child: Text(
                      "New Customer",
                      style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
                          color: isNewCustomer
                              ? styleSheet.COLOR.whiteColor
                              : styleSheet.COLOR.blackColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          styleSheet.appConfig.addHeight(20),
          LayoutBuilder(builder: (context, constraints) {
            if (isNewCustomer) {
              return Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: RadioListTile(
                          title: const Text('Personal Account'),
                          value: 1,
                          groupValue: selectedValue,
                          onChanged: (int? value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      Flexible(
                        flex: 1,
                        child: RadioListTile(
                          title: const Text('Business Account'),
                          value: 2,
                          groupValue: selectedValue,
                          onChanged: (int? value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(10),
                  Row(
                    children: [
                      const Flexible(
                        flex: 1,
                        child: PrimaryTextFormField(
                          hinttext: "Customer Name",
                        ),
                      ),
                      styleSheet.appConfig.addWidth(10),
                      const Flexible(
                        flex: 1,
                        child: PrimaryTextFormField(
                          hinttext: "Number",
                        ),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(10),
                  PrimaryDropDown(
                      isExpanded: true,
                      dropdownValue: selectedType,
                      items: listOfTypes,
                      value: (val) {
                        selectedType = val!;
                        setState(() {});
                      }),
                  styleSheet.appConfig.addHeight(10),
                  const PrimaryTextFormField(
                    hinttext: "TRN",
                  ),
                  styleSheet.appConfig.addHeight(20),
                  PrimaryBtnView(
                      borderRadius: 10,
                      btnName: "Add Customer",
                      onPressed: () {}),
                  styleSheet.appConfig.addHeight(10),
                ],
              ).paddingAll(10);
            } else {
              return Column(
                children: [
                  const PrimaryTextFormField(
                    suffixicon: Icon(Icons.search),
                    hinttext: "Search Customer",
                  ),
                  styleSheet.appConfig.addHeight(10),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
