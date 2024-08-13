import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/keyboard_component.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class CustomItemDialog extends StatefulWidget {
  bool isHeaderShow;
  CustomItemDialog({this.isHeaderShow = true, super.key});

  @override
  State<CustomItemDialog> createState() => _CustomItemDialogState();
}

class _CustomItemDialogState extends State<CustomItemDialog> {
  final priceController = TextEditingController();
  final customItemController = TextEditingController();
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: widget.isHeaderShow ? "Custom Item" : "",
      child: ListView(
        shrinkWrap: true,
        children: [
          TextFormField(
            controller: priceController,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintStyle: styleSheet.TEXT_THEME.fs18Bold
                    .copyWith(color: styleSheet.COLOR.greyColor),
                border: InputBorder.none,
                hintText: "AED 0.00"),
          ).paddingSymmetric(horizontal: 20),
          TextFormField(
            onTap: () => openVirtualKeyboard(),
            controller: customItemController,
            style: styleSheet.TEXT_THEME.fs12Medium,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Custom Item",
                hintStyle: styleSheet.TEXT_THEME.fs14Bold
                    .copyWith(color: styleSheet.COLOR.primaryColor),
                border: InputBorder.none),
          ),
          KeyboardComponentView(
            onInput: (value) {
              setState(() => priceController.text += value);
            },
            onValueRemove: () {
              if (priceController.text.isNotEmpty) {
                priceController.text = priceController.text
                    .substring(0, priceController.text.length - 1);
              }
              setState(() {});
            },
          ).paddingAll(20),
          // GridView.builder(
          //   padding: styleSheet.DECORATION.PADDING_20,
          //   itemCount: LocalData.keyboardBtnList.length,
          //   shrinkWrap: true,
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3,
          //       mainAxisSpacing: 10,
          //       crossAxisSpacing: 10,
          //       childAspectRatio: 10 / 3),
          //   itemBuilder: (context, i) {
          //     var btn = LocalData.keyboardBtnList[i];
          //     return KeyboardButtonView(
          //       widget: Icon(
          //         Icons.backspace,
          //         color: styleSheet.COLOR.redColor,
          //       ),
          //       index: i,
          //       btnName: btn.btnName,
          //       onPressed: () {},
          //     );
          //   },
          // ),
          styleSheet.appConfig.addHeight(10),
          Row(
            children: [
              Expanded(
                  child: PrimaryBtnView(
                      btnName: "Add To Cart",
                      onPressed: () {
                        productController.addProducts(ProductModel(
                            styleSheet.appConfig.generateId().toString(),
                            "",
                            customItemController.text.isNotEmpty
                                ? customItemController.text
                                : "Custom Item",
                            priceController.text,
                            "",
                            "",
                            ""));
                        Navigator.of(context).pop();
                      })),
            ],
          ).paddingSymmetric(horizontal: 20),
          styleSheet.appConfig.addHeight(10),
        ],
      ),
    );
  }
}
