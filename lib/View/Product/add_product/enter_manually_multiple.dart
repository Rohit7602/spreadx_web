import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/barcode_dialog.dart';
import 'package:spreadx_web/Components/Dialog/edit_product_dialog.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
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
    final view = ResponsiveHandler().getResponsiveness(context);
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

                                setState(() {});
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
                      styleSheet.appConfig.addHeight(20),
                      products.isEmpty
                          ? Expanded(
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
                          : Expanded(
                              child: DataTable2(
                                dataRowHeight: 40,
                                headingRowHeight: 30,
                                columnSpacing: 5,
                                horizontalMargin: 12,
                                columns: [
                                  DataColumn2(
                                    fixedWidth: view.tableSmallWidth,
                                    label: const Text('No'),
                                    size: ColumnSize.L,
                                  ),
                                  DataColumn2(
                                    fixedWidth: view.tableSmallWidth,
                                    label: const Text('Barcode'),
                                  ),
                                  const DataColumn2(
                                    label: Text('Description'),
                                  ),
                                  const DataColumn2(
                                    fixedWidth: 120,
                                    label: Text('Brand'),
                                  ),
                                  const DataColumn2(
                                    fixedWidth: 120,
                                    label: Text('Category'),
                                  ),
                                  const DataColumn2(
                                    fixedWidth: 120,
                                    label: Text('Unit'),
                                    numeric: true,
                                  ),
                                  const DataColumn2(
                                    fixedWidth: 120,
                                    label: Text('Selling Price'),
                                    numeric: true,
                                  ),
                                  const DataColumn2(
                                    fixedWidth: 120,
                                    label: Text('Stock'),
                                    numeric: true,
                                  ),
                                  const DataColumn2(
                                    fixedWidth: 120,
                                    label: Text(''),
                                    numeric: true,
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  products.length,
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProductDialog();
                                              }),
                                          Text("${(index + 1)}.".toString())),
                                      DataCell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProductDialog();
                                              }),
                                          Text("22".toString())),
                                      DataCell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProductDialog();
                                              }),
                                          Text(products[index].description)),
                                      DataCell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProductDialog();
                                              }),
                                          Text(products[index].price)),
                                      DataCell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProductDialog();
                                              }),
                                          Text(products[index].category)),
                                      DataCell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProductDialog();
                                              }),
                                          Text(
                                              "${double.parse(products[index].price.toString()) * double.parse(products[index].qty.toString())}")),
                                      DataCell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProductDialog();
                                              }),
                                          Text(
                                              "${double.parse(products[index].price.toString()) * double.parse(products[index].qty.toString())}")),
                                      DataCell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProductDialog();
                                              }),
                                          Text(
                                              "${double.parse(products[index].price.toString()) * double.parse(products[index].qty.toString())}")),
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            products.remove(products[index]);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: styleSheet.COLOR.redColor,
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color:
                                                  styleSheet.COLOR.whiteColor,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${products.length} products are ready to submit."),
                      PrimaryBtnView(
                          borderRadius: 5,
                          btnName: "SUBMIT",
                          onPressed: widget.onPressedBack!)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
