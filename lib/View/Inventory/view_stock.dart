// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/navigation_controller.dart';
import 'package:spreadx_web/View/Inventory/stock_details_view.dart';
import 'package:spreadx_web/main.dart';

class ViewStockView extends StatelessWidget {
  void Function() onPressedBack;
  ViewStockView({required this.onPressedBack, super.key});

  RxString selectedView = RxString("default");

  var navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    var defaultView = Stack(
      alignment: Alignment.topLeft,
      children: [
        ListView.separated(
          padding: styleSheet.DECORATION.PADDING_20.copyWith(top: 40),
          shrinkWrap: true,
          itemCount: 1,
          separatorBuilder: (context, i) => styleSheet.appConfig.addHeight(10),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                navController.setShowSearch(false);
                selectedView("stockDetails");
              },
              child: Card(
                color: styleSheet.COLOR.fieldGreyColor,
                shape: RoundedRectangleBorder(
                    borderRadius: styleSheet.DECORATION.RADIUS_10),
                elevation: 2,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                          color: styleSheet.COLOR.productCardGreyColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: Text(
                        "64 x 36",
                        style: styleSheet.TEXT_THEME.fs14Medium
                            .copyWith(color: styleSheet.COLOR.greyColor),
                      ),
                    ),
                    styleSheet.appConfig.addWidth(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "default",
                          style: styleSheet.TEXT_THEME.fs16Bold
                              .copyWith(color: styleSheet.COLOR.blackColor),
                        ),
                        styleSheet.appConfig.addHeight(4),
                        const Text(
                          "default",
                        ),
                        styleSheet.appConfig.addHeight(2),
                        const Text(
                          ": 29.0",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
        IconButton(
            onPressed: () {
              onPressedBack();
            },
            icon: const Icon(Icons.arrow_back)),
      ],
    );

    return Obx(() {
      if (selectedView.value == "stockDetails") {
        return StockDetailsView(
          onPressedBack: () {
            navController.setShowSearch(true);
            selectedView("default");
          },
        );
      } else {
        return defaultView;
      }
    });
  }
}
