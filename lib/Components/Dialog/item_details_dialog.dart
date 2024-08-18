// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

import '../Button/primary_btn.dart';

class ItemDetailsDialog extends StatefulWidget {
  ProductModel productModel;
  int i;

  ItemDetailsDialog({required this.productModel, required this.i, super.key});

  @override
  State<ItemDetailsDialog> createState() => _ItemDetailsDialogState();
}

class _ItemDetailsDialogState extends State<ItemDetailsDialog> {
  int itemCount = 1;
  bool _value = false;

  final priceController = TextEditingController();
  final prNameController = TextEditingController();
  final qtyController = TextEditingController();
  final barcodeController = TextEditingController();
  final vatController = TextEditingController();
  final discount = TextEditingController();
  final discountPercentage = TextEditingController();
  var product = Get.find<ProductController>();

  incrementCounter() {
    if (int.parse(widget.productModel.qty) != 1) {
      widget.productModel.qty =
          (int.parse(widget.productModel.qty) - 1).toString();
      setState(() {});
    }
  }

  decrementCounter() {
    if (int.parse(widget.productModel.qty) > 0) {
      widget.productModel.qty =
          (int.parse(widget.productModel.qty) + 1).toString();
      setState(() {});
    }
  }

  @override
  void initState() {
    getInitialState();
    super.initState();
  }

  getInitialState() {
    final subtotal = ((double.tryParse(widget.productModel.price) ?? 0) *
        (int.tryParse(widget.productModel.qty) ?? 0));
    prNameController.text = widget.productModel.productName;
    priceController.text = widget.productModel.price;
    qtyController.text = widget.productModel.qty;
    barcodeController.text = widget.productModel.barCode;
    vatController.text = widget.productModel.vat;
    discount.text = widget.productModel.discount;
    discountPercentage.text =
        (((double.tryParse(widget.productModel.discount) ?? 0) /
                    (subtotal +
                        (subtotal *
                            (double.tryParse(widget.productModel.vat) ?? 0) /
                            100))) *
                100)
            .toStringAsFixed(2);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final subtotal = ((double.tryParse(priceController.text) ?? 0) *
        (int.tryParse(widget.productModel.qty) ?? 0));
    final total = subtotal +
        (subtotal * (double.tryParse(vatController.text) ?? 0) / 100);

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
                    controller: barcodeController,
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
                    controller: prNameController,
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
                                controller: priceController,
                                onTap: () => openVirtualKeyboard(),
                                fillColor: true,
                                hinttext: "Enter Price",
                                onChange: (value) => setState(
                                    () => priceController.text = value),
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
                                controller: vatController,
                                onTap: () => openVirtualKeyboard(),
                                fillColor: true,
                                hinttext: "0.0",
                                onChange: (value) =>
                                    setState(() => vatController.text = value),
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
                          onPressed: () => incrementCounter(),
                          icon: const Icon(Icons.remove),
                        ),
                        Text(widget.productModel.qty),
                        IconButton(
                          onPressed: () => decrementCounter(),
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
                                      controller: discountPercentage,
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
                                      controller: discount,
                                      onTap: () => openVirtualKeyboard(),
                                      fillColor: true,
                                      hinttext: "0.0",
                                      onChange: (value) => setState(() {
                                        discount.text = value;
                                        discountPercentage.text = value
                                                .isNotEmpty
                                            ? (((double.tryParse(value) ?? 0) /
                                                        total) *
                                                    100)
                                                .toStringAsFixed(2)
                                            : '0';
                                      }),
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
                          discount.text.isEmpty || discount.text == "0.00"
                              ? Text("AED $total",
                                  style: styleSheet.TEXT_THEME.fs20Bold)
                              : Text.rich(TextSpan(
                                  text: "AED $total",
                                  style: styleSheet.TEXT_THEME.fs20Bold
                                      .copyWith(
                                          color: styleSheet.COLOR.greyColor,
                                          decoration:
                                              TextDecoration.lineThrough),
                                  children: [
                                      TextSpan(
                                          text:
                                              "   AED ${(total - (double.tryParse(discount.text) ?? 0)).toStringAsFixed(2)}",
                                          style: styleSheet.TEXT_THEME.fs20Bold
                                              .copyWith(
                                                  color:
                                                      styleSheet.COLOR.redColor,
                                                  decoration:
                                                      TextDecoration.none))
                                    ])),
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
                        product.updateProductPrice(
                            ProductModel(
                                widget.productModel.id,
                                prNameController.text.isNotEmpty
                                    ? prNameController.text
                                    : widget.productModel.productName,
                                prNameController.text.isNotEmpty
                                    ? prNameController.text
                                    : widget.productModel.productName,
                                priceController.text.isNotEmpty
                                    ? priceController.text
                                    : widget.productModel.price,
                                widget.productModel.qty,
                                widget.productModel.stock,
                                priceController.text.isNotEmpty
                                    ? priceController.text
                                    : widget.productModel.price,
                                barCode: barcodeController.text.isNotEmpty
                                    ? barcodeController.text
                                    : widget.productModel.barCode,
                                vat: vatController.text.isNotEmpty
                                    ? vatController.text
                                    : widget.productModel.vat,
                                discount: discount.text.isNotEmpty
                                    ? discount.text
                                    : widget.productModel.discount),
                            widget.i);
                        Navigator.of(context).pop();
                      }),
                ],
              )
            ],
          ),
        )).paddingSymmetric(horizontal: 10);
  }
}
