// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class ItemDetailsDialog extends StatefulWidget {
  int itemCount;
  ItemDetailsDialog({required this.itemCount, super.key});

  @override
  State<ItemDetailsDialog> createState() => _ItemDetailsDialogState();
}

class _ItemDetailsDialogState extends State<ItemDetailsDialog> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "Item Details",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BARCODE",
              style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                  color: styleSheet.COLOR.blackColor.withOpacity(0.7)),
            ),
            const SecondaryTextFormField(
              fieldColor: true,
              hinttext: "Enter Barcode",
            ),
            styleSheet.appConfig.addHeight(20),
            Text(
              "PRODUCT NAME",
              style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                  color: styleSheet.COLOR.blackColor.withOpacity(0.7)),
            ),
            const SecondaryTextFormField(
              fieldColor: true,
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
                              color:
                                  styleSheet.COLOR.blackColor.withOpacity(0.7)),
                        ),
                        const SecondaryTextFormField(
                          fieldColor: true,
                          hinttext: "Enter Price",
                        ),
                      ]),
                ),
                styleSheet.appConfig.addWidth(20),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: styleSheet.COLOR.greyColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text("Per Item"),
                  ),
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: styleSheet.DECORATION.RADIUS_5,
                  color: styleSheet.COLOR.lightGreyColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.itemCount++;
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(itemCount.toString()),
                  IconButton(
                    onPressed: () {
                      widget.itemCount--;
                      setState(() {});
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        )).paddingSymmetric(horizontal: 10);
  }
}
