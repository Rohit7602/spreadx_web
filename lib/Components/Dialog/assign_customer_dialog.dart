import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
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
    final view = ResponsiveHandler().getResponsiveness(context);

    return Dialog(
      child: Container(
        constraints: BoxConstraints(
            minHeight: 350,
            maxHeight: styleSheet.appConfig.getScreenHeight(context) * 0.8),
        width: styleSheet.appConfig.getScreenWidth(context) * view.dialogWidth,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              color: styleSheet.COLOR.lightBlueColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (isNewCustomer) isNewCustomer = false;
                      setState(() {});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                styleSheet.DECORATION.RADIUS_5.copyWith(
                              topRight: const Radius.circular(0),
                              bottomRight: const Radius.circular(0),
                            ),
                          ),
                          child: Text(
                            "Existing Customer",
                            style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                              color: isNewCustomer
                                  ? styleSheet.COLOR.blackColor
                                  : styleSheet.COLOR.primaryColor,
                            ),
                          ),
                        ),
                        styleSheet.appConfig.addHeight(8),
                        if (!isNewCustomer)
                          Container(
                            height: 2,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: styleSheet.DECORATION.RADIUS_5,
                              color: styleSheet.COLOR.primaryColor,
                            ),
                          )
                      ],
                    ),
                  ),
                  styleSheet.appConfig.addWidth(20),
                  InkWell(
                    onTap: () {
                      if (!isNewCustomer) isNewCustomer = true;
                      setState(() {});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                styleSheet.DECORATION.RADIUS_5.copyWith(
                              topLeft: const Radius.circular(0),
                              bottomLeft: const Radius.circular(0),
                            ),
                          ),
                          child: Text(
                            "New Customer",
                            style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                                color: isNewCustomer
                                    ? styleSheet.COLOR.primaryColor
                                    : styleSheet.COLOR.blackColor),
                          ),
                        ),
                        styleSheet.appConfig.addHeight(8),
                        if (isNewCustomer)
                          Container(
                            height: 2,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: styleSheet.DECORATION.RADIUS_5,
                              color: styleSheet.COLOR.primaryColor,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
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
                            title: Text(
                              'Personal Account',
                              style: styleSheet.TEXT_THEME.fs14Normal,
                            ),
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
                            title: Text(
                              'Business Account',
                              style: styleSheet.TEXT_THEME.fs14Normal,
                            ),
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
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryBtnView(
                              btnName: "Add Customer", onPressed: () {}),
                        ),
                      ],
                    ),
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
                ).paddingAll(10);
              }
            }),
          ],
        ),
      ),
    );
  }
}
