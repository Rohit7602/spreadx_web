import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class EditProductDialog extends StatefulWidget {
  const EditProductDialog({super.key});

  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  final TextEditingController barcode = TextEditingController();
  final TextEditingController productName = TextEditingController();
  final TextEditingController productShortName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController sellingPrice = TextEditingController();
  final TextEditingController vat = TextEditingController();
  final TextEditingController initialStock = TextEditingController();

  final RxString brand = RxString("");
  final RxString category = RxString("");
  final RxString unit = RxString("");
  final RxString sellingPricePerUnit = RxString("");
  final RxString shouldVatIncluded = RxString("");

  final RxList<String> brandList = RxList<String>(["Default"]);
  final RxList<String> categoryList = RxList<String>(["Default"]);
  final RxList<String> unitList = RxList<String>(["PCS"]);

  // ["Per Item", "Per Weight", "Mixed"]

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "Edit Product",
        child: const Column(
          children: [],
        ));
  }
}

class _EditProductTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const _EditProductTextField(
      {super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: styleSheet.TEXT_THEME.fs12Bold),
        styleSheet.appConfig.addHeight(5),
        SecondaryTextFormField(
          controller: controller,
          fillColor: false,
        )
      ],
    );
  }
}
