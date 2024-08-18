// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Controller/navigation_controller.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Customer/customer_list.dart';
import 'package:spreadx_web/View/Data_center/data_center.dart';
import 'package:spreadx_web/View/Home/Widget/custom_drawer_view.dart';
import 'package:spreadx_web/View/Inventory/inventory_view.dart';
import 'package:spreadx_web/View/Product/product_view.dart';
import 'package:spreadx_web/View/Reports/reports_view.dart';
import 'package:spreadx_web/View/Support/support_and_legal.dart';
import 'package:spreadx_web/View/Supppliers/suppliers_view.dart';
import 'package:spreadx_web/View/Transactions/transaction_view.dart';
import 'package:spreadx_web/View/main_setup/main_setup.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class MainMenuDrawerView extends StatefulWidget {
  const MainMenuDrawerView({super.key});

  @override
  State<MainMenuDrawerView> createState() => _MainMenuDrawerViewState();
}

class _MainMenuDrawerViewState extends State<MainMenuDrawerView> {
  DrawerState drawerState = DrawerState.Dashboard;

  bool showSearchBar = false;

  var navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrawerAppBarView(
          showLeading: false,
          title: getDrawerName(drawerState),
          actions: Obx(
            () => Row(
              children: [
                if (navController.showSearch.value && showSearchBar)
                  SizedBox(
                    width: 600,
                    child: PrimaryTextFormField(
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "Search..",
                    ),
                  ),
                if (navController.showSearch.value)
                  IconButton(
                      onPressed: () {
                        showSearchBar = true;
                        setState(() {});
                      },
                      icon: Icon(
                        CupertinoIcons.search,
                        color: styleSheet.COLOR.whiteColor,
                      )),
                styleSheet.appConfig.addWidth(10),
                InkWell(
                    onTap: () {
                      context.go(MyRoute.homeScreen);
                    },
                    child: Image.asset(styleSheet.icons.screenIcon)),
                if (navController.showExportBtn.value)
                  InkWell(
                      onTap: () {},
                      child: Image.asset(
                        styleSheet.icons.exportIcon,
                        height: 20,
                      )).paddingOnly(right: 20, left: 10),
              ],
            ),
          )),
      drawer: CustomDrawerView(
        onTap: setDrawerState,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          switch (drawerState) {
            case DrawerState.Products:
              return const ProductView();
            case DrawerState.Inventory:
              return const InventoryView();
            case DrawerState.Transactions:
              return TransactionView(
                onPressedBack: () {},
              );
            case DrawerState.Suppliers:
              return const SuppliersView();
            case DrawerState.Customers:
              return const CustomerListView();
            case DrawerState.Reports:
              return const ReportsView();
            case DrawerState.DataCenter:
              return const DataCenterView();
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
    showSearchBar = false;

    setState(() {
      getSearchBar();
    });
    Navigator.of(context).pop();
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

  getSearchBar() {
    if (drawerState == DrawerState.Transactions) {
      navController.showExportBtn(true);
      navController.setShowSearch(true);
    } else if (drawerState == DrawerState.Products ||
        drawerState == DrawerState.Customers ||
        drawerState == DrawerState.Transactions ||
        drawerState == DrawerState.Suppliers) {
      navController.setShowSearch(true);
    } else {
      navController.setShowSearch(false);
    }
  }
}
