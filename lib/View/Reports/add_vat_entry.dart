import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/alert_dialog.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class AddVatEntryView extends StatelessWidget {
  void Function() onPressedBack;
  AddVatEntryView({required this.onPressedBack, super.key});

  final RxString _trType = RxString("");

  final RxString _vatType = RxString("");

  final vatController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: styleSheet.DECORATION.PADDING_20,
      padding: styleSheet.DECORATION.PADDING_20.copyWith(top: 0),
      decoration: BoxDecoration(
          color: styleSheet.COLOR.whiteColor,
          borderRadius: styleSheet.DECORATION.RADIUS_5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
          styleSheet.appConfig.addHeight(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TRANSACTION NO.",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    SecondaryTextFormField(
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "Transaction No.",
                    ),
                    styleSheet.appConfig.addHeight(20),
                    Text(
                      "TRANSACTION TYPE",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    Obx(() => PrimaryDropDown(
                        isExpanded: true,
                        border: true,
                        hint: "Select Type",
                        dropdownValue: _trType.value,
                        items: const ["Sales", "Purchase", "Refund"],
                        value: (v) {
                          _trType(v!);
                        })),
                    styleSheet.appConfig.addHeight(20),
                    Text(
                      "TRANSACTION DATE",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    SecondaryTextFormField(
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "Transaction Date",
                    ),
                    styleSheet.appConfig.addHeight(20),
                    Text(
                      "PRODUCT NAME",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    SecondaryTextFormField(
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "Product Name",
                    ),
                    styleSheet.appConfig.addHeight(20),
                    Text(
                      "PRODUCT QTY",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    SecondaryTextFormField(
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "Product Qty",
                    ),
                    styleSheet.appConfig.addHeight(20),
                  ],
                ),
              ),
              styleSheet.appConfig.addWidth(15),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CUSTOMER NAME",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    SecondaryTextFormField(
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "Customer Name",
                    ),
                    styleSheet.appConfig.addHeight(20),
                    Text(
                      "TRANSACTION TYPE",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    Obx(() => PrimaryDropDown(
                        isExpanded: true,
                        border: true,
                        hint: "Select Type",
                        dropdownValue: _vatType.value,
                        items: const [
                          "AE Output VAT Exempted",
                          "AE Output VAT 0% - Goods",
                          "AE Output VAT 5% - Goods"
                        ],
                        value: (v) {
                          _vatType(v!);
                        })),
                    styleSheet.appConfig.addHeight(20),
                    Text(
                      "VAT AMOUNT",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    SecondaryTextFormField(
                      controller: vatController,
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "0.00",
                    ),
                    styleSheet.appConfig.addHeight(20),
                    Text(
                      "TOTAL AMOUNT",
                      style: styleSheet.TEXT_THEME.fs10Medium
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    SecondaryTextFormField(
                      controller: amountController,
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "0.00",
                    ),
                    styleSheet.appConfig.addHeight(20),
                  ],
                ),
              ),
            ],
          ),
          styleSheet.appConfig.addWidth(20),
          PrimaryBtnView(
            btnName: 'ADD ENTRY',
            onPressed: () {
              createState(context);
            },
            isExpanded: true,
          )
        ],
      ),
    );
  }

  createState(context) {
    if (vatController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
                title: "Alert",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Pelase Enter VAT Amount",
                      style: styleSheet.TEXT_THEME.fs12Medium,
                    ),
                    styleSheet.appConfig.addHeight(15),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButtonView(
                            btnName: "OK",
                            onPressed: () {
                              Navigator.of(context).pop();
                            })),
                  ],
                ));
          });
    } else if (amountController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
                title: "Alert",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Pelase Enter Total Amount",
                      style: styleSheet.TEXT_THEME.fs12Medium,
                    ),
                    styleSheet.appConfig.addHeight(15),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButtonView(
                            btnName: "OK",
                            onPressed: () {
                              Navigator.of(context).pop();
                            })),
                  ],
                ));
          });
    } else {
      onPressedBack();
    }
  }
}
