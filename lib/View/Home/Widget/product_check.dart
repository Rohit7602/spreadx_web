// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/custom_grid.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class ProductCheckView extends StatefulWidget {
  Function(String) backBtn;
  ProductCheckView({required this.backBtn, super.key});

  @override
  State<ProductCheckView> createState() => _ProductCheckViewState();
}

class _ProductCheckViewState extends State<ProductCheckView> {
  var product = Get.find<ProductController>();

  bool gridTile = false;
  bool isStock = true;
  bool isCategory = true;
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: styleSheet.DECORATION.PADDING_5,
      color: styleSheet.COLOR.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          styleSheet.appConfig.addHeight(10),
          PrimaryTextFormField(
            onTap: () {
              openVirtualKeyboard();
            },
            label: false,
            prefixIcon: const Icon(Icons.search),
            hinttext: "Search..",
          ),
          styleSheet.appConfig.addHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    widget.backBtn("");
                  },
                  icon: const Icon(Icons.arrow_back)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
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
                            color: styleSheet.COLOR.greyColor.withOpacity(0.3)),
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
                    onTap: () {
                      if (gridTile == false) {
                        setState(() {
                          gridTile = true;
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: styleSheet.COLOR.greyColor.withOpacity(0.3)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
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
                              color:
                                  styleSheet.COLOR.greyColor.withOpacity(0.3)),
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
                    onTap: () {
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
                            color: styleSheet.COLOR.greyColor.withOpacity(0.3)),
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
                onTap: () {
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
                onTap: () {
                  if (isCategory) {
                    setState(() {
                      isCategory = false;
                    });
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
          styleSheet.appConfig.addHeight(20),
          Expanded(
              child: !gridTile
                  ? GridView.builder(
                      itemCount: LocalData.productList.length,
                      shrinkWrap: true,
                      gridDelegate: CustomSliverGridDelegate(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          itemHeight: 110),
                      itemBuilder: (context, i) {
                        return LayoutBuilder(builder: (context, constraints) {
                          final pr = LocalData.productList[i];
                          return GestureDetector(
                              onTap: () {
                                var product = Get.find<ProductController>();
                                product.addProducts(pr);
                                itemCount++;
                                setState(() {});
                              },
                              child: isCategory
                                  ? const CustomGridForCategory()
                                  : CustomGridForProducts(
                                      data: pr,
                                      isInCart: product.productList
                                          .any((v) => v.id == pr.id),
                                    ));
                        });
                      })
                  : ListView.separated(
                      itemCount: LocalData.productList.length,
                      itemBuilder: (context, i) {
                        return LayoutBuilder(builder: (context, constraints) {
                          final pr = LocalData.productList[i];
                          return GestureDetector(
                              onTap: () {
                                var product = Get.find<ProductController>();
                                product.addProducts(pr);
                                itemCount++;
                                setState(() {});
                              },
                              child: isCategory
                                  ? const CustomListForCategory()
                                  : CustomListForProducts(
                                      data: pr,
                                      isInCart: product.productList
                                          .any((v) => v.id == pr.id),
                                    ));
                        });
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          styleSheet.appConfig.addHeight(10),
                    ))
        ],
      ),
    );
  }
}

class CustomGridForProducts extends StatelessWidget {
  ProductModel data;
  bool isInCart;
  CustomGridForProducts({required this.data, this.isInCart = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              border: Border.all(color: styleSheet.COLOR.greyColor),
              color: styleSheet.COLOR.productCardGreyColor,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, -3),
                    // blurStyle: BlurStyle.outer,
                    color: styleSheet.COLOR.blackColor.withOpacity(0.2),
                    blurRadius: 8),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text("640 X 360", style: styleSheet.TEXT_THEME.fs12Medium),
              Container(
                padding: const EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                height: 20,
                color: styleSheet.COLOR.blackColor,
                child: Text(
                  "default- PCS",
                  style: styleSheet.TEXT_THEME.fs10Normal
                      .copyWith(color: styleSheet.COLOR.whiteColor),
                ),
              ),
            ],
          ),
        ),
        int.parse(data.stock) <= 5
            ? Positioned(
                top: 2,
                left: 2,
                child: Container(
                  margin: styleSheet.DECORATION.PADDING_2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color:
                        int.parse(data.stock) > 0 && int.parse(data.stock) <= 5
                            ? styleSheet.COLOR.darkGreenColor
                            : styleSheet.COLOR.redColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "In Stock ${int.parse(data.stock.toString())}",
                    style: styleSheet.TEXT_THEME.fs12Medium
                        .copyWith(color: styleSheet.COLOR.whiteColor),
                  ),
                ),
              )
            : const SizedBox(),
        !isInCart
            ? const SizedBox()
            : Positioned(
                top: 0,
                right: 0,
                child: Container(
                  margin: styleSheet.DECORATION.PADDING_2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color: styleSheet.COLOR.darkGreenColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    data.qty.toString(),
                    style: styleSheet.TEXT_THEME.fs12Medium
                        .copyWith(color: styleSheet.COLOR.whiteColor),
                  ),
                ),
              ),
      ],
    );
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

class CustomGridForCategory extends StatelessWidget {
  const CustomGridForCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        height: 70,
        decoration:
            BoxDecoration(color: styleSheet.COLOR.whiteColor, boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              color: styleSheet.COLOR.blackColor.withOpacity(0.2),
              blurRadius: 8),
        ]),
        child: Text("Grocery Items (1)", style: styleSheet.TEXT_THEME.fs12Bold),
      ),
    );
  }
}

class CustomListForProducts extends StatelessWidget {
  ProductModel data;
  bool isInCart;
  CustomListForProducts({super.key, required this.data, this.isInCart = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 66,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.description,
                      style: styleSheet.TEXT_THEME.fs12Bold,
                    ),
                    styleSheet.appConfig.addHeight(4),
                    Text(
                      "default",
                      style: styleSheet.TEXT_THEME.fs12Normal,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        int.parse(data.stock) <= 5
            ? Positioned(
                bottom: 2,
                left: 2,
                child: Container(
                  margin: styleSheet.DECORATION.PADDING_2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color:
                        int.parse(data.stock) > 0 && int.parse(data.stock) <= 5
                            ? styleSheet.COLOR.darkGreenColor
                            : styleSheet.COLOR.redColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "In Stock ${int.parse(data.stock)}",
                    style: styleSheet.TEXT_THEME.fs12Medium
                        .copyWith(color: styleSheet.COLOR.whiteColor),
                  ),
                ),
              )
            : const SizedBox(),
        !isInCart
            ? const SizedBox()
            : Positioned(
                top: 0,
                right: 0,
                child: Container(
                  margin: styleSheet.DECORATION.PADDING_2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color: styleSheet.COLOR.darkGreenColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    data.qty.toString(),
                    style: styleSheet.TEXT_THEME.fs12Medium
                        .copyWith(color: styleSheet.COLOR.whiteColor),
                  ),
                ),
              ),
      ],
    );
  }
}
