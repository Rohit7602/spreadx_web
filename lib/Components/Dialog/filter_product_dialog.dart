import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/main.dart';

class FilterProductDialog extends StatefulWidget {
  const FilterProductDialog({super.key});

  @override
  State<FilterProductDialog> createState() => _FilterProductDialogState();
}

class _FilterProductDialogState extends State<FilterProductDialog> {
  bool isBrandDialog = false;

  bool isCatDialog = false;

  List selectedList = [];

  List<String> brandList = ["default", "Puma"];

  List<String> catList = ["default", "Puma"];

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "",
        child: LayoutBuilder(builder: (context, contstr) {
          if (isBrandDialog) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          isBrandDialog = false;
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_back)),
                    Text(
                      "Brands",
                      style: styleSheet.TEXT_THEME.fs14Bold,
                    ),
                    TextButtonView(
                        btnName: "Clear All",
                        onPressed: () {
                          selectedList.clear();
                          setState(() {});
                        })
                  ],
                ),
                styleSheet.appConfig.addHeight(10),
                Row(children: [
                  ...List.generate(brandList.length, (i) {
                    return InkWell(
                        onTap: () => addItem(i),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 45,
                          decoration: BoxDecoration(
                              color:
                                  selectedList.any((val) => val == brandList[i])
                                      ? styleSheet.COLOR.primaryColor
                                      : styleSheet.COLOR.whiteColor,
                              borderRadius: styleSheet.DECORATION.RADIUS_5,
                              border: Border.all(
                                  color: styleSheet.COLOR.greyColor
                                      .withOpacity(0.4))),
                          child: Text(
                            brandList[i],
                            style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
                                color: selectedList
                                        .any((val) => val == brandList[i])
                                    ? styleSheet.COLOR.whiteColor
                                    : styleSheet.COLOR.blackColor),
                          ),
                        )).paddingOnly(right: 10);
                  })
                ]),
              ],
            );
          } else if (isCatDialog) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          isCatDialog = false;
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_back)),
                    Text(
                      "Categories",
                      style: styleSheet.TEXT_THEME.fs14Bold,
                    ),
                    TextButtonView(
                        btnName: "Clear All",
                        onPressed: () {
                          selectedList.clear();
                          setState(() {});
                        })
                  ],
                ),
                styleSheet.appConfig.addHeight(10),
                Row(children: [
                  ...List.generate(brandList.length, (i) {
                    return InkWell(
                        onTap: () => addItem(i),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 45,
                          decoration: BoxDecoration(
                              color:
                                  selectedList.any((val) => val == brandList[i])
                                      ? styleSheet.COLOR.primaryColor
                                      : styleSheet.COLOR.whiteColor,
                              borderRadius: styleSheet.DECORATION.RADIUS_5,
                              border: Border.all(
                                  color: styleSheet.COLOR.greyColor
                                      .withOpacity(0.4))),
                          child: Text(
                            brandList[i],
                            style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
                                color: selectedList
                                        .any((val) => val == brandList[i])
                                    ? styleSheet.COLOR.whiteColor
                                    : styleSheet.COLOR.blackColor),
                          ),
                        )).paddingOnly(right: 10);
                  })
                ]),
              ],
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter Products",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.primaryColor),
                    ),
                    TextButtonView(btnName: "Clear All", onPressed: () {})
                  ],
                ),
                styleSheet.appConfig.addHeight(10),
                InkWell(
                  onTap: () {
                    isBrandDialog = true;
                    setState(() {});
                  },
                  child: Container(
                      padding: styleSheet.DECORATION.PADDING_10,
                      decoration: BoxDecoration(
                        color: styleSheet.COLOR.lightGreyColor,
                        borderRadius: styleSheet.DECORATION.RADIUS_5,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Brand"),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      )),
                ),
                styleSheet.appConfig.addHeight(10),
                InkWell(
                  onTap: () {
                    isCatDialog = true;
                    setState(() {});
                  },
                  child: Container(
                      padding: styleSheet.DECORATION.PADDING_10,
                      decoration: BoxDecoration(
                        color: styleSheet.COLOR.lightGreyColor,
                        borderRadius: styleSheet.DECORATION.RADIUS_5,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Category"),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      )),
                ),
                styleSheet.appConfig.addHeight(10),
              ],
            );
          }
        }));
  }

  addItem(int i) {
    final isAvailable = selectedList.any((v) => v == brandList[i]);

    if (isAvailable) {
      selectedList.remove(brandList[i]);
    } else {
      selectedList.add(brandList[i]);
    }

    setState(() {});
  }
}
