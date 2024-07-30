import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

class ProductCheckView extends StatefulWidget {
  const ProductCheckView({super.key});

  @override
  State<ProductCheckView> createState() => _ProductCheckViewState();
}

class _ProductCheckViewState extends State<ProductCheckView> {
  bool gridTile = false;
  bool isStock = true;
  bool isCategory = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: styleSheet.DECORATION.PADDING_5,
      color: styleSheet.COLOR.whiteColor,
      child: Column(
        children: [
          styleSheet.appConfig.addHeight(10),
          const PrimaryTextFormField(
            label: false,
            prefixIcon: Icon(Icons.search),
            hinttext: "Search..",
          ),
          styleSheet.appConfig.addHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                        border: Border.all(color: styleSheet.COLOR.greyColor),
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
                        border: Border.all(color: styleSheet.COLOR.greyColor),
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
          !gridTile
              ? Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    ...List.generate(3, (index) {
                      return Container(
                        alignment: Alignment.bottomCenter,
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: styleSheet.COLOR.greyColor),
                            color: styleSheet.COLOR.productCardGreyColor,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, -3),
                                  // blurStyle: BlurStyle.outer,
                                  color: styleSheet.COLOR.blackColor
                                      .withOpacity(0.2),
                                  blurRadius: 8),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Text("640 X 360",
                                style: styleSheet.TEXT_THEME.fs12Medium),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              alignment: Alignment.centerLeft,
                              height: 20,
                              color: styleSheet.COLOR.blackColor,
                              child: Text(
                                "default- PCS",
                                style: styleSheet.TEXT_THEME.fs10Normal
                                    .copyWith(
                                        color: styleSheet.COLOR.whiteColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                )
              : const CustomListForProducsts(),
        ],
      ),
    );
  }
}

class CustomListForProducsts extends StatelessWidget {
  const CustomListForProducsts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      separatorBuilder: (context, i) => styleSheet.appConfig.addHeight(10),
      itemBuilder: (context, i) {
        return Container(
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
                "default- PCS",
                style: styleSheet.TEXT_THEME.fs12Bold,
              ),
              styleSheet.appConfig.addHeight(4),
              Text(
                "default",
                style: styleSheet.TEXT_THEME.fs12Normal,
              ),
            ],
          ),
        );
      },
    );
  }
}
