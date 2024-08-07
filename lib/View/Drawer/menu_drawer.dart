// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/View/Customer/customer_list.dart';
import 'package:spreadx_web/View/Home/Widget/custom_drawer_view.dart';
import 'package:spreadx_web/View/Inventory/inventory_view.dart';
import 'package:spreadx_web/View/Product/product_view.dart';
import 'package:spreadx_web/View/Reports/reports_view.dart';
import 'package:spreadx_web/View/Support/support_and_legal.dart';
import 'package:spreadx_web/View/Supppliers/suppliers_view.dart';
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
      appBar: DrawerAppBarView(
          showLeading: false, title: getDrawerName(drawerState)),

      // AppBar(
      //   backgroundColor: styleSheet.COLOR.primaryColor,
      //   title: Text(
      //     getDrawerName(drawerState),
      //     style: styleSheet.TEXT_THEME.fs16Medium.copyWith(
      //       letterSpacing: 1.2,
      //       color: styleSheet.COLOR.whiteColor,
      //     ),
      //   ),
      //   actions: [
      //     InkWell(
      //         onTap: () {
      //           context.go(MyRoute.homeScreen);
      //         },
      //         child: Image.asset(styleSheet.icons.screenIcon)),
      //   ],
      // ),
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
              return const SuppliersView();
            case DrawerState.Customers:
              return const CustomerListView();
            case DrawerState.Reports:
              return const ReportsView();
            case DrawerState.DataCenter:
              return const Center(child: Text("Comming Soon"));
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
    drawerState = state;

    Navigator.of(context).pop();
    setState(() {});
  }

  String getDrawerName(DrawerState state) {
    switch (drawerState) {
      case DrawerState.Products:
        return "Products";
      case DrawerState.Inventory:
        return "Inventory";
      case DrawerState.Transactions:
        return "Transactions";
      case DrawerState.Suppliers:
        return "Suppliers";
      case DrawerState.Customers:
        return "Customers";
      case DrawerState.Reports:
        return "Reports";
      case DrawerState.DataCenter:
        return "Data Center";
      case DrawerState.MainSetup:
        return "Main Setup";
      case DrawerState.Support:
        return "Support & Legal";

      default:
        return "Dashboard";
    }
  }
}
