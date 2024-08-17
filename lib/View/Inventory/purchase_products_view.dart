// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/custom_item_dialog.dart';
import 'package:spreadx_web/Components/custom_grid.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Home/Widget/product_check.dart';
import 'package:spreadx_web/View/Inventory/checkout_view.dart';
import 'package:spreadx_web/View/Inventory/invoice_view.dart';
import 'package:spreadx_web/main.dart';

class PurchaseProductsView extends StatefulWidget {
  void Function() onPressedBack;
  bool? isSupplier;
  PurchaseProductsView(
      {required this.onPressedBack, this.isSupplier, super.key});

  @override
  State<PurchaseProductsView> createState() => _PurchaseProductsViewState();
}

class _PurchaseProductsViewState extends State<PurchaseProductsView> {
  var product = Get.find<ProductController>();

  bool gridTile = false;
  bool isStock = true;
  bool isCategory = true;
  int itemCount = 1;

  RxString selectedView = RxString("default");

  @override
  void initState() {
    product.addProducts(LocalData.productList.first);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var defaultView = Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            styleSheet.appConfig.addHeight(30),
            InkWell(
              borderRadius: styleSheet.DECORATION.RADIUS_20,
              onTap: () {
                selectedView("checkout");
              },
              child: Container(
                padding: styleSheet.DECORATION.PADDING_10,
                decoration: BoxDecoration(
                    color: styleSheet.COLOR.blackColor,
                    borderRadius: styleSheet.DECORATION.RADIUS_5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: styleSheet.COLOR.whiteColor,
                        ),
                        styleSheet.appConfig.addWidth(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${product.productList.length} items",
                              style: styleSheet.TEXT_THEME.fs12Medium
                                  .copyWith(color: styleSheet.COLOR.whiteColor),
                            ),
                            styleSheet.appConfig.addHeight(1),
                            Text(
                              "AED 0.00",
                              style: styleSheet.TEXT_THEME.fs12Medium
                                  .copyWith(color: styleSheet.COLOR.whiteColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Checkout",
                          style: styleSheet.TEXT_THEME.fs12Medium
                              .copyWith(color: styleSheet.COLOR.whiteColor),
                        ),
                        styleSheet.appConfig.addWidth(10),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: styleSheet.COLOR.whiteColor,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            styleSheet.appConfig.addHeight(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: styleSheet.DECORATION.RADIUS_20,
                      onTap: () async {
                        if (!await rebuild()) return;
                        if (gridTile) {
                          gridTile = false;
                          setState(() {});
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  styleSheet.COLOR.greyColor.withOpacity(0.3)),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          color: gridTile
                              ? styleSheet.COLOR.whiteColor
                              : styleSheet.COLOR.keyboardBtnColor,
                        ),
                        child: Icon(
                          Icons.dashboard,
                          size: 20,
                          color: styleSheet.COLOR.blackColor,
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: styleSheet.DECORATION.RADIUS_20,
                      onTap: () async {
                        if (!await rebuild()) return;
                        if (gridTile == false) {
                          gridTile = true;
                          setState(() {});
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  styleSheet.COLOR.greyColor.withOpacity(0.3)),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: gridTile
                              ? styleSheet.COLOR.keyboardBtnColor
                              : styleSheet.COLOR.whiteColor,
                        ),
                        child: Icon(
                          Icons.list,
                          size: 20,
                          color: styleSheet.COLOR.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                styleSheet.appConfig.addWidth(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: styleSheet.DECORATION.RADIUS_20,
                      onTap: () {
                        if (isStock == false) {
                          isStock = true;
                          setState(() {});
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.center,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: styleSheet.COLOR.greyColor
                                    .withOpacity(0.3)),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: isStock
                                ? styleSheet.COLOR.primaryColor
                                : styleSheet.COLOR.whiteColor,
                          ),
                          child: Text(
                            "All",
                            style: styleSheet.TEXT_THEME.fs12Medium.copyWith(
                              color: isStock
                                  ? styleSheet.COLOR.whiteColor
                                  : styleSheet.COLOR.blackColor,
                            ),
                          )),
                    ),
                    InkWell(
                      borderRadius: styleSheet.DECORATION.RADIUS_20,
                      onTap: () async {
                        if (!await rebuild()) return;
                        if (isStock) {
                          setState(() {
                            isStock = false;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  styleSheet.COLOR.greyColor.withOpacity(0.3)),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: isStock
                              ? styleSheet.COLOR.whiteColor
                              : styleSheet.COLOR.primaryColor,
                        ),
                        child: Text(
                          "Stock",
                          style: styleSheet.TEXT_THEME.fs12Medium.copyWith(
                            color: isStock
                                ? styleSheet.COLOR.blackColor
                                : styleSheet.COLOR.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            styleSheet.appConfig.addHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: styleSheet.DECORATION.RADIUS_20,
                  onTap: () async {
                    if (!await rebuild()) return;
                    if (isCategory == false) {
                      isCategory = true;

                      setState(() {});
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: styleSheet.COLOR.greyColor.withOpacity(0.3)),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: isCategory
                            ? styleSheet.COLOR.primaryColor
                            : styleSheet.COLOR.whiteColor,
                      ),
                      child: Text(
                        "Categories",
                        style: styleSheet.TEXT_THEME.fs12Medium.copyWith(
                          color: isCategory
                              ? styleSheet.COLOR.whiteColor
                              : styleSheet.COLOR.blackColor,
                        ),
                      )),
                ),
                InkWell(
                  borderRadius: styleSheet.DECORATION.RADIUS_20,
                  onTap: () async {
                    if (!await rebuild()) return;
                    if (isCategory) {
                      isCategory = false;

                      setState(() {});
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: styleSheet.COLOR.greyColor.withOpacity(0.3)),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: isCategory
                          ? styleSheet.COLOR.whiteColor
                          : styleSheet.COLOR.primaryColor,
                    ),
                    child: Text(
                      "Products",
                      style: styleSheet.TEXT_THEME.fs12Medium.copyWith(
                        color: isCategory
                            ? styleSheet.COLOR.blackColor
                            : styleSheet.COLOR.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            styleSheet.appConfig.addHeight(30),
            Expanded(
                child: !gridTile
                    ? GridView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        gridDelegate: CustomSliverGridDelegate(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            itemHeight: 110),
                        itemBuilder: (context, i) {
                          return LayoutBuilder(builder: (context, constraints) {
                            final pr = LocalData.productList[i];

                            if (isCategory) {
                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      isCategory = false;
                                      setState(() {});
                                      // var product =
                                      //     Get.find<ProductController>();
                                      // product.addProducts(pr);
                                      // itemCount++;
                                      // setState(() {});
                                    },
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              styleSheet.DECORATION.RADIUS_5,
                                          color: styleSheet
                                              .COLOR.productCardGreyColor,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0, 4),
                                                color: styleSheet
                                                    .COLOR.blackColor
                                                    .withOpacity(0.2),
                                                blurRadius: 8),
                                          ]),
                                      child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          alignment: Alignment.centerLeft,
                                          width: styleSheet.appConfig
                                              .getScreenWidth(context),
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: styleSheet.COLOR.blackColor,
                                            borderRadius:
                                                styleSheet.DECORATION.RADIUS_5,
                                          ),
                                          child: Text("Grocery Items (1)",
                                              style: styleSheet
                                                  .TEXT_THEME.fs12Medium
                                                  .copyWith(
                                                      color: styleSheet
                                                          .COLOR.whiteColor))),
                                    ),
                                  ),
                                  // itemCount != 0
                                  //     ? Container(
                                  //         margin: styleSheet.DECORATION.PADDING_2,
                                  //         padding:
                                  //             styleSheet.DECORATION.PADDING_5,
                                  //         decoration: BoxDecoration(
                                  //             color: styleSheet.COLOR.greenColor,
                                  //             borderRadius:
                                  //                 styleSheet.DECORATION.RADIUS_5),
                                  //         child: Text(
                                  //           "${itemCount.toString()}.0",
                                  //           style: styleSheet
                                  //               .TEXT_THEME.fs12Medium
                                  //               .copyWith(
                                  //                   color: styleSheet
                                  //                       .COLOR.whiteColor),
                                  //         ),
                                  //       )
                                  //     : const SizedBox()
                                ],
                              );
                            } else {
                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      var product =
                                          Get.find<ProductController>();
                                      product.addProducts(pr);
                                      itemCount++;
                                      setState(() {});
                                    },
                                    child: CustomGridForProducts(
                                      data: pr,
                                      isInCart: false,
                                    ),
                                  ),
                                  itemCount != 0
                                      ? Container(
                                          margin:
                                              styleSheet.DECORATION.PADDING_2,
                                          padding:
                                              styleSheet.DECORATION.PADDING_5,
                                          decoration: BoxDecoration(
                                              color:
                                                  styleSheet.COLOR.greenColor,
                                              borderRadius: styleSheet
                                                  .DECORATION.RADIUS_5),
                                          child: Text(
                                            "${itemCount.toString()}.0",
                                            style: styleSheet
                                                .TEXT_THEME.fs12Medium
                                                .copyWith(
                                                    color: styleSheet
                                                        .COLOR.whiteColor),
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              );
                            }
                          });
                        })
                    : ListView.separated(
                        itemCount: 1,
                        itemBuilder: (context, i) {
                          return LayoutBuilder(builder: (context, constraints) {
                            final pr = LocalData.productList[i];
                            return isCategory
                                ? GestureDetector(
                                    onTap: () {
                                      isCategory = false;
                                      setState(() {});
                                    },
                                    child: const CustomListForCategory())
                                : Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            var product =
                                                Get.find<ProductController>();
                                            product.addProducts(pr);
                                            itemCount++;
                                            setState(() {});
                                          },
                                          child:
                                              CustomListForProducts(data: pr)),
                                      itemCount != 0
                                          ? Container(
                                              margin: styleSheet
                                                  .DECORATION.PADDING_2,
                                              padding: styleSheet
                                                  .DECORATION.PADDING_5,
                                              decoration: BoxDecoration(
                                                  color: styleSheet
                                                      .COLOR.greenColor,
                                                  borderRadius: styleSheet
                                                      .DECORATION.RADIUS_5),
                                              child: Text(
                                                "${itemCount.toString()}.0",
                                                style: styleSheet
                                                    .TEXT_THEME.fs12Medium
                                                    .copyWith(
                                                        color: styleSheet
                                                            .COLOR.whiteColor),
                                              ),
                                            )
                                          : const SizedBox()
                                    ],
                                  );
                          });
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            styleSheet.appConfig.addHeight(10),
                      ))
          ],
        ).paddingAll(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                    onPressed: () {
                      widget.onPressedBack();
                    },
                    icon: const Icon(Icons.arrow_back))
                .paddingSymmetric(horizontal: 10),
            TextButtonView(
                btnName: "+ Add Custom Item",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomItemDialog(
                          isHeaderShow: false,
                        );
                      }).then((val) {
                    setState(() {});
                  });
                }).paddingAll(20),
          ],
        )
      ],
    );

    return Obx(() {
      if (selectedView.value == "checkout") {
        return CheckoutView(
          showISSupplier: widget.isSupplier != null ? widget.isSupplier! : true,
          onPressedBack: () {
            selectedView("default");
            setState(() {});
          },
        );
      } else if (selectedView.value == "invoice") {
        return InvoiceView(
          onPressedBack: () {
            selectedView("default");
          },
        );
      } else {
        return defaultView;
      }
    });
  }

  Future<bool> rebuild() async {
    if (!mounted) return false;

    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return false;
    }

    setState(() {});
    return true;
  }
}

class CustomListForCategory extends StatelessWidget {
  const CustomListForCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      padding: styleSheet.DECORATION.PADDING_10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: styleSheet.COLOR.whiteColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: styleSheet.COLOR.blackColor.withOpacity(0.1),
                blurRadius: 6)
          ]),
      child: Text(
        "Grocery Items (1)",
        style: styleSheet.TEXT_THEME.fs12Bold,
      ),
    );
  }
}
