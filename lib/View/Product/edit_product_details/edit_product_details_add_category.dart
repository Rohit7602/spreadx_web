import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/View/Product/edit_product_details/widgets/add_brand_dialog.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class EditProductAddCategoryView extends StatefulWidget {
  final ProductModel product;
  final void Function(String)? onPressedBack;
  const EditProductAddCategoryView(
      {super.key, required this.product, required this.onPressedBack});

  @override
  State<EditProductAddCategoryView> createState() =>
      _EditProductAddCategoryViewState();
}

class _EditProductAddCategoryViewState
    extends State<EditProductAddCategoryView> {
  final RxList<String> _categories = ["default"].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          elevation: 5,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AddBrandDialog(
                    title: "Category",
                    ontap: (v) {
                      _categories.add(v);
                    },
                  );
                });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: styleSheet.COLOR.primaryColor,
          child: const Icon(Icons.add)),
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
                    onPressed: () {
                      widget.onPressedBack!("");
                    },
                    icon: const Icon(Icons.arrow_back_outlined)),
              ),
              Column(
                children: [
                  PrimaryTextFormField(
                      prefixIcon: const Icon(Icons.search),
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "Search Category..."),
                  styleSheet.appConfig.addHeight(10),
                  Obx(() => GridView.builder(
                      itemCount: _categories.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 8,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            widget.onPressedBack!(_categories[i]);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: styleSheet.COLOR.fieldGreyColor)),
                            child: Text(_categories[i],
                                style: styleSheet.TEXT_THEME.fs18Bold),
                          ),
                        );
                      }))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
