// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Home/Widget/custom_drawer_view.dart';
import 'package:spreadx_web/View/Inventory/inventory_view.dart';
import 'package:spreadx_web/View/Product/product_view.dart';
import 'package:spreadx_web/View/Support/support_and_legal.dart';
import 'package:spreadx_web/View/Transactions/transaction_list.dart';
import 'package:spreadx_web/View/Transactions/transaction_view.dart';
import 'package:spreadx_web/View/main_setup/main_setup.dart';
import 'package:spreadx_web/main.dart';

class MainMenuDrawerView extends StatefulWidget {
  const MainMenuDrawerView({super.key});

  @override
  State<MainMenuDrawerView> createState() => _MainMenuDrawerViewState();
}

class _MainMenuDrawerViewState extends State<MainMenuDrawerView> {
  DrawerState drawerState = DrawerState.Products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: styleSheet.COLOR.primaryColor,
        title: Text(
          "Dashboard",
          style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
            color: styleSheet.COLOR.whiteColor,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                context.go(MyRoute.homeScreen);
              },
              child: Image.asset(styleSheet.icons.screenIcon)),
        ],
      ),
      drawer: CustomDrawerView(
        onTap: setDrawerState,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          switch (drawerState) {
            case DrawerState.Products:
              return ProductView();
            case DrawerState.Inventory:
              return const InventoryView();
            case DrawerState.Transactions:
              return const TransactionView();
            case DrawerState.Suppliers:
              return const SizedBox();
            case DrawerState.Customers:
              return const SizedBox();
            case DrawerState.Reports:
              return const SizedBox();
            case DrawerState.DataCenter:
              return const SizedBox();
            case DrawerState.MainSetup:
              return const MainSetupView();
            case DrawerState.Support:
              return SupportAndLegalView();

            default:
              return Center(
                child: Image.asset(
                  styleSheet.images.appLogoLarge,
                  fit: BoxFit.cover,
                  width: styleSheet.appConfig.getScreenWidth(context) * 0.7,
                ),
              );
          }
        },
      ),
    );
  }

  setDrawerState(DrawerState state) {
    print(state);
    drawerState = state;
    Navigator.of(context).pop();
    setState(() {});
  }
}
