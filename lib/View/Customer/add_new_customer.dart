import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/add_customer_controller.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/phone_text_field.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/View/Customer/business_type_view.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class AddNewCustomerView extends StatefulWidget {
  final void Function()? onPressedBack;
  const AddNewCustomerView({this.onPressedBack, super.key});

  @override
  State<AddNewCustomerView> createState() => _AddNewCustomerViewState();
}

class _AddNewCustomerViewState extends State<AddNewCustomerView> {
  bool isBusinessType = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AddCustomerController>();
    return Scaffold(
      body: isBusinessType
          ? BusinessTypeView(
              onTap: (val) {
                controller.businessType.text = val;
                isBusinessType = false;
                setState(() {});
              },
            )
          : Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      styleSheet.appConfig.addHeight(20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: widget.onPressedBack,
                            icon: const Icon(Icons.arrow_back_outlined)),
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: styleSheet.COLOR.lightGreyColor),
                            child: const Icon(
                              Icons.person,
                              size: 100,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(right: 30),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: styleSheet.COLOR.primaryColor,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.edit,
                                color: styleSheet.COLOR.whiteColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      styleSheet.appConfig.addHeight(25),
                      const Spacer(),
                      DrawerButtonView(
                        btnName: "Add New Customer",
                        onPressed: () {
                          controller.onSave(context);
                          widget.onPressedBack!();
                        },
                      ).paddingAll(20)
                    ],
                  ),
                ),
                styleSheet.appConfig.addWidth(30),
                Flexible(
                    flex: 2,
                    child: ListView(
                      children: [
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "Barcode",
                            controller: controller.barcode),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "Code",
                            controller: controller.code),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "First Name",
                            controller: controller.firstname),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "Last Name",
                            controller: controller.lastName),
                        styleSheet.appConfig.addHeight(20),
                        PhoneTextField(
                            controller: controller.phoneNumber,
                            onValuePick: (Country country) {}),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "Email",
                            controller: controller.email),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "Address",
                            controller: controller.address),
                        styleSheet.appConfig.addHeight(20),
                        Obx(() => PrimaryDropDown(
                            isExpanded: true,
                            border: true,
                            hint: "Account Type",
                            dropdownValue: controller.accountType,
                            items: const ["Cash", "Credit"],
                            value: (v) {
                              controller.setAccountType(v!);
                            })),
                        styleSheet.appConfig.addHeight(20),
                        Obx(
                          () => controller.accountType.toLowerCase() == "credit"
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
                                    styleSheet.appConfig.addHeight(20),
                                  ],
                                )
                              : const SizedBox(),
                        ),
                        Obx(() => PrimaryDropDown(
                            isExpanded: true,
                            border: true,
                            hint: "Account Category",
                            dropdownValue: controller.accountCategory,
                            items: const [
                              "Personal Account",
                              "Business Account"
                            ],
                            value: (v) {
                              controller.setAccountCategory(v!);
                            })),
                        styleSheet.appConfig.addHeight(20),
                        Obx(
                          () => controller.accountCategory.toLowerCase() ==
                                  "business account"
                              ? Column(
                                  children: [
                                    SecondaryTextFormField(
                                        onTap: () => openVirtualKeyboard(),
                                        hinttext: "Business Name",
                                        controller: controller.businessName),
                                    styleSheet.appConfig.addHeight(20),
                                    SecondaryTextFormField(
                                        onTap: () {
                                          isBusinessType = true;
                                          setState(() {});
                                        },
                                        hinttext: "Business Type",
                                        controller: controller.businessType),
                                    styleSheet.appConfig.addHeight(20),
                                  ],
                                )
                              : const SizedBox(),
                        ),
                      ],
                    ))
              ],
            ),
    );
  }
}
