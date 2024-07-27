import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class ProductCheckView extends StatefulWidget {
  const ProductCheckView({super.key});

  @override
  State<ProductCheckView> createState() => _ProductCheckViewState();
}

class _ProductCheckViewState extends State<ProductCheckView> {
  bool isStock = false;
  bool isCategory = true;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Flexible(
      flex: view.dashboardProductCardFlex.toInt(),
      child: Container(
        padding: styleSheet.DECORATION.PADDING_5,
        color: styleSheet.COLOR.whiteColor,
        child: Column(
          children: [
            const PrimaryTextFormField(
              suffixicon: Icon(Icons.search),
              hinttext: "Search..",
            ),
            styleSheet.appConfig.addHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (isStock) {
                      print("if case run ");
                      isStock = false;
                      setState(() {});
                    } else {
                      print("else case run ");
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
                        color: isStock
                            ? styleSheet.COLOR.whiteColor
                            : styleSheet.COLOR.primaryColor,
                      ),
                      child: Text(
                        "All",
                        style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
                          color: isStock
                              ? styleSheet.COLOR.blackColor
                              : styleSheet.COLOR.whiteColor,
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    if (isStock == false) {
                      setState(() {
                        isStock = true;
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
                      color: isStock
                          ? styleSheet.COLOR.primaryColor
                          : styleSheet.COLOR.whiteColor,
                    ),
                    child: Text(
                      "Stock",
                      style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
                        color: isStock
                            ? styleSheet.COLOR.whiteColor
                            : styleSheet.COLOR.blackColor,
                      ),
                    ),
                  ),
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
                        border: Border.all(color: styleSheet.COLOR.greyColor),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: isCategory
                            ? styleSheet.COLOR.primaryColor
                            : styleSheet.COLOR.whiteColor,
                      ),
                      child: Text(
                        "Categories",
                        style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
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
                      border: Border.all(color: styleSheet.COLOR.greyColor),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: isCategory
                          ? styleSheet.COLOR.whiteColor
                          : styleSheet.COLOR.primaryColor,
                    ),
                    child: Text(
                      "Products",
                      style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
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
            GridView.builder(
                shrinkWrap: true,
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, constra) {
                  return Container(
                    margin: styleSheet.DECORATION.PADDING_10,
                    alignment: Alignment.bottomCenter,
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border.all(color: styleSheet.COLOR.greyColor),
                        color: styleSheet.COLOR.lightGreyColor,
                        boxShadow: styleSheet.DECORATION.primaryShadow),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        const Text("640 X360"),
                        Container(
                          height: 30,
                          color: styleSheet.COLOR.greyColor,
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
