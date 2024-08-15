import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/View/Product/add_product/enter_manually_multiple.dart';
import 'package:spreadx_web/View/Product/add_product/enter_manually_single.dart';
import 'package:spreadx_web/View/Product/add_product/import_export_products.dart';
import 'package:spreadx_web/View/Product/add_product/widgets/add_product_btn.dart';
import 'package:spreadx_web/main.dart';

class AddProductView extends StatefulWidget {
  final void Function()? onPressedBack;
  const AddProductView({super.key, required this.onPressedBack});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final List<Map<String, dynamic>> list = [
    {
      "title": "Scan Your Products",
      "icon": Icons.document_scanner_outlined,
      "route": AddProductState.Scan,
      "disable": true,
    },
    {
      "title": "Import/Export Products",
      "icon": Icons.upload_file_outlined,
      "route": AddProductState.Import_Export,
      "disable": false,
    },
    {
      "title": "Enter Manually (Single)",
      "icon": Icons.keyboard_outlined,
      "route": AddProductState.Single_Product,
      "disable": false,
    },
    {
      "title": "Enter Manually (Multiple)",
      "icon": Icons.keyboard_outlined,
      "route": AddProductState.Multiple_Product,
      "disable": false,
    },
  ];

  Rx<AddProductState> selected = Rx<AddProductState>(AddProductState.Default);

  @override
  Widget build(BuildContext context) {
    final defaultView = Scaffold(
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
                    child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(styleSheet.images.add_product,
                              height: 300),
                          styleSheet.appConfig.addHeight(40),
                          Text("How do you want to add your items?",
                              style: styleSheet.TEXT_THEME.fs16Bold)
                        ],
                      ),
                    ),
                    styleSheet.appConfig.addWidth(5),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: styleSheet.COLOR.greyColor
                                          .withOpacity(0.5)))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(list.length, (i) {
                                final data = list[i];
                                return AddProductBtn(
                                    ontap: () {
                                      selected(data['route']);
                                    },
                                    title: data['title'],
                                    icon: data['icon'],
                                    disable: data['disable']);
                              })
                            ],
                          ),
                        ))
                  ],
                ))
              ],
            )),
      )),
    );

    return Obx(() => getView(defaultView));
  }

  void onPressedBack() {
    selected(AddProductState.Default);
    setState(() {});
  }

  Widget getView(Widget defaultView) {
    switch (selected.value) {
      case AddProductState.Import_Export:
        return ImportExportProducts(onPressedBack: onPressedBack);
      case AddProductState.Multiple_Product:
        return EnterManuallyMultipleProductsView(onPressedBack: onPressedBack);
      case AddProductState.Single_Product:
        return EnterManuallySingleProductView(onPressedBack: onPressedBack);
      default:
        return defaultView;
    }
  }
}
