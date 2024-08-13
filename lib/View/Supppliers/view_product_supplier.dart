import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/main.dart';

class ViewProductSupplier extends StatefulWidget {
  void Function() onPressedBack;
  ViewProductSupplier({required this.onPressedBack, super.key});

  @override
  State<ViewProductSupplier> createState() => _ViewProductSupplierState();
}

class _ViewProductSupplierState extends State<ViewProductSupplier> {
  var product = Get.find<ProductController>();

  List<ProductModel> selectedProductList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: widget.onPressedBack,
            icon: const Icon(Icons.arrow_back)),
        Wrap(
          children: [
            ...List.generate(
              product.assignedProductList.length,
              (index) => InkWell(
                onTap: () {
                  if (selectedProductList.any((val) =>
                      val.id == product.assignedProductList[index].id)) {
                    selectedProductList
                        .remove(product.assignedProductList[index]);
                  } else {
                    selectedProductList.add(product.assignedProductList[index]);
                  }

                  setState(() {});
                },
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: styleSheet.DECORATION.RADIUS_5,
                          color: styleSheet.COLOR.productCardGreyColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            styleSheet.appConfig.addHeight(30),
                            Text(
                              "640 x 360",
                              style: styleSheet.TEXT_THEME.fs16Medium
                                  .copyWith(color: styleSheet.COLOR.greyColor),
                            ),
                            styleSheet.appConfig.addHeight(8),
                            Container(
                              padding: styleSheet.DECORATION.PADDING_5,
                              width:
                                  styleSheet.appConfig.getScreenWidth(context),
                              decoration: BoxDecoration(
                                  color: styleSheet.COLOR.greyColor,
                                  borderRadius: styleSheet.DECORATION.RADIUS_5),
                              child: Text(
                                product.assignedProductList[index].productName,
                                style: styleSheet.TEXT_THEME.fs12Medium
                                    .copyWith(
                                        color: styleSheet.COLOR.whiteColor),
                              ),
                            ),
                          ],
                        )),
                    selectedProductList.any((e) =>
                            e.id == product.assignedProductList[index].id)
                        ? Icon(
                            Icons.check_circle_outline,
                            color: styleSheet.COLOR.blackColor,
                          ).paddingAll(10)
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ],
        ).paddingAll(20),
      ],
    );
  }
}
