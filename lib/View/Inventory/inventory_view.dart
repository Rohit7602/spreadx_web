import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/View/Inventory/purchase_products_view.dart';
import 'package:spreadx_web/View/Transactions/transaction_view.dart';
import 'package:spreadx_web/main.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  RxString selectedView = RxString("default");
  @override
  Widget build(BuildContext context) {
    var defaultView = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(styleSheet.images.inventoryImage),
              styleSheet.appConfig.addHeight(10),
              Text(
                "Manage your inventory by viewing, create MRN or make stock transfer",
                textAlign: TextAlign.center,
                style: styleSheet.TEXT_THEME.fs12Bold
                    .copyWith(color: styleSheet.COLOR.greyColor),
              ),
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
        Container(
          width: 3,
          color: styleSheet.COLOR.lightGreyColor,
        ),
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerButtonView(btnName: "View Stock", onPressed: () {}),
              styleSheet.appConfig.addHeight(10),
              DrawerButtonView(
                  btnName: "Purchase Products",
                  onPressed: () {
                    selectedView("products");
                  }),
              styleSheet.appConfig.addHeight(10),
              DrawerButtonView(
                  btnName: "Purchase History",
                  onPressed: () {
                    selectedView("history");
                  }),
            ],
          ).paddingAll(10),
        ),
      ],
    );

    return Obx(() {
      if (selectedView.value == "history") {
        return const TransactionView();
      } else if (selectedView.value == "products") {
        return const PurchaseProductsView();
      } else {
        return defaultView;
      }
    });
  }
}
