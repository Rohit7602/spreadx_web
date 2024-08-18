// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/navigation_controller.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/filter_product_dialog.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/View/Product/add_product/add_product_view.dart';
import 'package:spreadx_web/View/Product/product_details_view.dart';
import 'package:spreadx_web/main.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  var productList = Get.find<ProductController>();

  RxString selectedView = RxString("default");

  Rx<ProductModel?> product = Rx<ProductModel?>(null);

  var navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    final defaultView = Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product List (${productList.productList.length})",
                    style: styleSheet.TEXT_THEME.fs14Bold
                        .copyWith(color: styleSheet.COLOR.primaryColor)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        styleSheet.icons.scannerIcon,
                        color: styleSheet.COLOR.primaryColor,
                      ),
                    ),
                    styleSheet.appConfig.addWidth(10),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const FilterProductDialog();
                            });
                      },
                      icon: Image.asset(
                        styleSheet.icons.filterIcon,
                        color: styleSheet.COLOR.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            styleSheet.appConfig.addHeight(10),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              alignment: WrapAlignment.start,
              children: [
                ...List.generate(productList.productList.length, (i) {
                  return GestureDetector(
                    onTap: () {
                      navController.setShowSearch(false);
                      product(productList.productList[i]);
                      selectedView("details");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: styleSheet.DECORATION.RADIUS_10,
                      ),
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          color: styleSheet.COLOR.bgColor,
                          borderRadius: styleSheet.DECORATION.RADIUS_10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: styleSheet.COLOR.productCardGreyColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: styleSheet.COLOR.blackColor
                                          .withOpacity(0.2),
                                      blurRadius: 8),
                                ],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: const Text("640 X 360"),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                styleSheet.appConfig.addHeight(10),
                                Text(
                                  productList.productList[i].description,
                                  style: styleSheet.TEXT_THEME.fs14Bold,
                                ),
                                styleSheet.appConfig.addHeight(3),
                                Text(
                                  productList.productList[i].description,
                                  style: styleSheet.TEXT_THEME.fs12Normal,
                                ),
                                styleSheet.appConfig.addHeight(8),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: styleSheet.COLOR.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        "default",
                                        style: styleSheet.TEXT_THEME.fs10Medium
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.whiteColor),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            )
          ],
        ).paddingAll(20),
        Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  navController.setShowSearch(false);
                  selectedView("add");
                },
                backgroundColor: styleSheet.COLOR.primaryColor,
                child: const Icon(Icons.add)))
      ],
    );

    return Obx(() {
      if (selectedView.value == "default") {
        return defaultView;
      } else if (selectedView.value == "add") {
        return AddProductView(onPressedBack: () {
          navController.setShowSearch(true);
          selectedView("default");
          setState(() {});
        });
      } else {
        return ProductDetailsView(
            product: product.value!,
            onPressedBack: () {
              navController.setShowSearch(true);
              selectedView("default");
              setState(() {});
            });
      }
    });
  }
}
