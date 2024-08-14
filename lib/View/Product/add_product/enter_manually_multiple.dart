import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/barcode_dialog.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class EnterManuallyMultipleProductsView extends StatefulWidget {
  final void Function()? onPressedBack;
  const EnterManuallyMultipleProductsView(
      {super.key, required this.onPressedBack});

  @override
  State<EnterManuallyMultipleProductsView> createState() =>
      _EnterManuallyMultipleProductsViewState();
}

class _EnterManuallyMultipleProductsViewState
    extends State<EnterManuallyMultipleProductsView> {
  final TextEditingController barcodeController = TextEditingController();

  RxList<ProductModel> products = RxList<ProductModel>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: styleSheet.appConfig.getScreenWidth(context),
              height: styleSheet.appConfig.getScreenHeight(context),
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
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: PrimaryTextFormField(
                                      controller: barcodeController,
                                      readonly: true,
                                      onTap: () async {
                                        final data = await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return BarcodeDialog(
                                                  hintText: "Barcode");
                                            });
                                        barcodeController.text = data;
                                        print(data);
                                      },
                                      hinttext: "Barcode")),
                              styleSheet.appConfig.addWidth(20),
                              PrimaryBtnView(
                                  btnName: "Add",
                                  onPressed: () {
                                    products.add(ProductModel(
                                        DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString(),
                                        "Product ${products.length + 1}",
                                        "Product ${products.length + 1} Description",
                                        "0.00",
                                        "1",
                                        "0",
                                        "0.00",
                                        barCode: barcodeController.text));
                                    barcodeController.clear();
                                  }),
                              styleSheet.appConfig.addWidth(40),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.qr_code_scanner,
                                      size: 25,
                                      color: styleSheet.COLOR.primaryColor)),
                              styleSheet.appConfig.addWidth(40),
                            ],
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("{ }",
                                  style: TextStyle(
                                      fontSize: 150,
                                      fontWeight: FontWeight.bold,
                                      color: styleSheet.COLOR.greyColor)),
                              styleSheet.appConfig.addHeight(30),
                              Text(
                                  "Products list is empty. Scan or Add to show.",
                                  style: styleSheet.TEXT_THEME.fs12Bold
                                      .copyWith(
                                          color: styleSheet.COLOR.greyColor))
                            ],
                          ))
                        ],
                      ))
                    ],
                  )))),
    );
  }
}
