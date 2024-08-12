// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

import '../Button/primary_btn.dart';

class ItemDetailsDialog extends StatefulWidget {
  int itemCount;
  ItemDetailsDialog({required this.itemCount, super.key});

  @override
  State<ItemDetailsDialog> createState() => _ItemDetailsDialogState();
}

class _ItemDetailsDialogState extends State<ItemDetailsDialog> {
  int itemCount = 1;
  bool _value = false;

  increaseCount() => setState(() => itemCount++);
  decreaseCount() => setState(() => itemCount > 0 ? itemCount-- : null);
  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "Item Details",
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "BARCODE",
                    style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                        color: styleSheet.COLOR.blackColor.withOpacity(0.7)),
                  ),
                  SecondaryTextFormField(
                    onTap: () => openVirtualKeyboard(),
                    fillColor: true,
                    hinttext: "Enter Barcode",
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Text(
                    "PRODUCT NAME",
                    style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                        color: styleSheet.COLOR.blackColor.withOpacity(0.7)),
                  ),
                  SecondaryTextFormField(
                    onTap: () => openVirtualKeyboard(),
                    fillColor: true,
                    hinttext: "Enter Product",
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PRICE",
                                style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                                    color: styleSheet.COLOR.blackColor
                                        .withOpacity(0.7)),
                              ),
                              SecondaryTextFormField(
                                onTap: () => openVirtualKeyboard(),
                                fillColor: true,
                                hinttext: "Enter Price",
                              ),
                              // styleSheet.appConfig.addHeight(6),
                              // const Text("Price included VAT 36.75")
                            ]),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "VAT",
                                style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                                    color: styleSheet.COLOR.blackColor
                                        .withOpacity(0.7)),
                              ),
                              SecondaryTextFormField(
                                onTap: () => openVirtualKeyboard(),
                                fillColor: true,
                                hinttext: "0.0",
                              ),
                            ]),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Text(
                    "QUANTITY",
                    style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                        color: styleSheet.COLOR.blackColor.withOpacity(0.7)),
                  ),
                  styleSheet.appConfig.addHeight(10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: styleSheet.DECORATION.RADIUS_5,
                        color: styleSheet.COLOR.lightGreyColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => decreaseCount(),
                          icon: const Icon(Icons.remove),
                        ),
                        Text(itemCount.toString()),
                        IconButton(
                          onPressed: () => increaseCount(),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Text(
                    "DISCOUNT",
                    style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                        color: styleSheet.COLOR.blackColor.withOpacity(0.7)),
                  ),
                  styleSheet.appConfig.addHeight(10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 3,
                        height: 50,
                        color: styleSheet.COLOR.redColor,
                      ),
                      styleSheet.appConfig.addWidth(5),
                      Flexible(
                        flex: 1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PERCENTAGE",
                                style: styleSheet.TEXT_THEME.fs10Bold.copyWith(
                                    color: styleSheet.COLOR.blackColor
                                        .withOpacity(0.7)),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: SecondaryTextFormField(
                                      onTap: () => openVirtualKeyboard(),
                                      fillColor: true,
                                      hinttext: "0.0",
                                    ),
                                  ),
                                  Text("%",
                                      style: styleSheet.TEXT_THEME.fs18Bold)
                                ],
                              ),
                            ]),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      Flexible(
                        flex: 1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "AMOUNT",
                                textAlign: TextAlign.end,
                                style: styleSheet.TEXT_THEME.fs10Bold.copyWith(
                                    color: styleSheet.COLOR.blackColor
                                        .withOpacity(0.7)),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("AED",
                                      style: styleSheet.TEXT_THEME.fs18Bold),
                                  Expanded(
                                    child: SecondaryTextFormField(
                                      onTap: () => openVirtualKeyboard(),
                                      fillColor: true,
                                      hinttext: "0.0",
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      styleSheet.appConfig.addWidth(5),
                      Container(
                        width: 3,
                        height: 50,
                        color: styleSheet.COLOR.redColor,
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Text(
                    "NOTES",
                    style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                        color: styleSheet.COLOR.blackColor.withOpacity(0.7)),
                  ),
                  styleSheet.appConfig.addHeight(10),
                  SecondaryTextFormField(
                    onTap: () => openVirtualKeyboard(),
                    fillColor: true,
                    hinttext: "Add a Note",
                  ),
                ],
              )),
              styleSheet.appConfig.addHeight(20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: styleSheet.DECORATION.RADIUS_5,
                          color: styleSheet.COLOR.lightGreyColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Total", style: styleSheet.TEXT_THEME.fs12Bold),
                          Text("AED 35.00",
                              style: styleSheet.TEXT_THEME.fs20Bold),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              styleSheet.appConfig.addHeight(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Switch.adaptive(
                        activeColor: styleSheet.COLOR.greyColor,
                        thumbColor: WidgetStateProperty.all(
                            styleSheet.COLOR.blackColor),
                        value: _value,
                        onChanged: (newValue) =>
                            setState(() => _value = newValue),
                      ),
                      Text(
                        "Keep Open after apply",
                        style: styleSheet.TEXT_THEME.fs12Normal,
                      )
                    ],
                  ),
                  SecondaryButtonView(
                      btnName: "UPDATE",
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )
            ],
          ),
        )).paddingSymmetric(horizontal: 10);
  }
}
