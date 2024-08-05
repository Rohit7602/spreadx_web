import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

import '../../keyboard_handler.dart';

class AssignCustomerDialog extends StatefulWidget {
  const AssignCustomerDialog({super.key});

  @override
  State<AssignCustomerDialog> createState() => _AssignCustomerDialogState();
}

class _AssignCustomerDialogState extends State<AssignCustomerDialog> {
  int selectedValue = 1;
  bool isNewCustomer = false;

  final phoneController = TextEditingController();

  List<String> listOfTypes = ["Individual", "Business"];
  String selectedType = "Individual";

  String dropValue = "Account Type";

  bool savenew = false;
  toggleNewCustomer() {
    setState(() => savenew = !savenew);
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}"),
          ],
        ),
      );
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
          mainAxisSize: MainAxisSize.min,
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Flexible(
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
                    PrimaryTextFormField(
                      hinttext: "Customer Name",
                      onTap: () => openVirtualKeyboard(),
                    ),
                    styleSheet.appConfig.addHeight(10),
                    SecondaryTextFormField(
                      onTap: () => openVirtualKeyboard(),
                      prefixIcon: SizedBox(
                        width: 140,
                        child: CountryPickerDropdown(
                          isExpanded: true,
                          initialValue: 'in',
                          itemBuilder: _buildDropdownItem,
                          onValuePicked: (Country country) {},
                        ),
                      ),
                      keyboardtype: TextInputType.phone,
                      controller: phoneController,
                      hinttext: "(50 | 52 | 54 | 55 | 56 | 58 | xxxxx)",
                    ),
                    styleSheet.appConfig.addHeight(10),
                    savenew
                        ? Row(
                            children: [
                              Expanded(
                                child: PrimaryDropDown(
                                    dropdownValue: dropValue,
                                    items: const [
                                      "Account Type",
                                      "CASH",
                                      "CREDIT",
                                    ],
                                    value: (value) =>
                                        setState(() => dropValue = value!)),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    savenew && dropValue == "CREDIT"
                        ? Column(
                            children: [
                              styleSheet.appConfig.addHeight(10),
                              PrimaryTextFormField(
                                hinttext: "Credit Limit",
                                onTap: () => openVirtualKeyboard(),
                              ),
                              styleSheet.appConfig.addHeight(10),
                              PrimaryTextFormField(
                                hinttext: "Days Limit",
                                onTap: () => openVirtualKeyboard(),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    styleSheet.appConfig.addHeight(10),
                    selectedValue == 2
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryTextFormField(
                                hinttext: "TRN",
                                onTap: () => openVirtualKeyboard(),
                              ),
                              styleSheet.appConfig.addHeight(20),
                            ],
                          )
                        : const SizedBox(),
                    GestureDetector(
                      onTap: () => toggleNewCustomer(),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Checkbox.adaptive(
                                value: savenew,
                                onChanged: (v) => toggleNewCustomer()),
                            Text("Save as new Customer",
                                style: styleSheet.TEXT_THEME.fs12Medium)
                          ],
                        ),
                      ),
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
                    PrimaryTextFormField(
                      suffixicon: const Icon(Icons.search),
                      hinttext: "Search Customer",
                      onTap: () => openVirtualKeyboard(),
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
