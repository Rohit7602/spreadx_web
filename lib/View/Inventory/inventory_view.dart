import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/navigation_controller.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/View/Inventory/purchase_products_view.dart';
import 'package:spreadx_web/View/Inventory/stock_details_view.dart';
import 'package:spreadx_web/View/Inventory/view_stock.dart';
import 'package:spreadx_web/View/Transactions/transaction_view.dart';
import 'package:spreadx_web/main.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  Rx<InventoryState> selectedView = Rx<InventoryState>(InventoryState.Default);
  var navController = Get.find<NavigationController>();
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
              DrawerButtonView(
                  btnName: "View Stock",
                  onPressed: () {
                    selectedView(InventoryState.Stock);

                    navController.setShowSearch(true);
                    setState(() {});
                  }),
              styleSheet.appConfig.addHeight(10),
              DrawerButtonView(
                  btnName: "Purchase Products",
                  onPressed: () {
                    navController.setShowSearch(true);
                    selectedView(InventoryState.Purchase_Product);
                    setState(() {});
                  }),
              styleSheet.appConfig.addHeight(10),
              DrawerButtonView(
                  btnName: "Purchase History",
                  onPressed: () {
                    navController.setShowSearch(true);
                    selectedView(InventoryState.Purchase_History);

                    setState(() {});
                  }),
            ],
          ).paddingAll(10),
        ),
      ],
    );

    return Obx(() => getView(selectedView.value, defaultView));
  }

  getView(state, defaultView) {
    switch (state) {
      case InventoryState.Stock:
        return ViewStockView(
          onPressedBack: () {
            selectedView(InventoryState.Default);
            navController.setShowSearch(false);
          },
        );
      case InventoryState.Purchase_Product:
        return PurchaseProductsView(
          onPressedBack: () {
            selectedView(InventoryState.Default);
            navController.setShowSearch(false);
          },
        );
      case InventoryState.Purchase_History:
        return TransactionView(
          isComingFromtr: false,
          onPressedBack: () {
            selectedView(InventoryState.Default);
            navController.setShowSearch(false);
          },
        );
      default:
        return defaultView;
    }
  }
}
