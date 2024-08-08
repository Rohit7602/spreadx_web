import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Customer/business_type_view.dart';
import 'package:spreadx_web/View/Transactions/transaction_view.dart';
import 'package:spreadx_web/main.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  bool purchaseHistory = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constra) {
      if (purchaseHistory) {
        return Stack(
          alignment: Alignment.topLeft,
          children: [
            const TransactionView(),
            IconButton(
                onPressed: () {
                  purchaseHistory = false;
                  setState(() {});
                },
                icon: const Icon(Icons.arrow_back_outlined)),
          ],
        );
      } else {
        return Row(
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
                      btnName: "Purchase Products", onPressed: () {}),
                  styleSheet.appConfig.addHeight(10),
                  DrawerButtonView(
                      btnName: "Purchase History",
                      onPressed: () {
                        purchaseHistory = true;
                        setState(() {});
                      }),
                ],
              ).paddingAll(10),
            ),
          ],
        );
      }
    });
  }
}
