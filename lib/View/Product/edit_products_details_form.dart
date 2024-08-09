import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/main.dart';

class EditProductsDetailsFormView extends StatefulWidget {
  final ProductModel product;
  final void Function()? onPressedBack;
  const EditProductsDetailsFormView(
      {super.key, required this.product, required this.onPressedBack});

  @override
  State<EditProductsDetailsFormView> createState() =>
      _EditProductsDetailsFormViewState();
}

class _EditProductsDetailsFormViewState
    extends State<EditProductsDetailsFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: styleSheet.appConfig.getScreenHeight(context),
        width: styleSheet.appConfig.getScreenWidth(context),
        child: Padding(
            padding: styleSheet.DECORATION.PADDING_20,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: widget.onPressedBack,
                      icon: const Icon(Icons.arrow_back_outlined)),
                ),
              ],
            )),
      )),
    );
  }
}
