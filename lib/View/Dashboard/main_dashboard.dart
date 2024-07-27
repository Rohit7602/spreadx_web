// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/View/Dashboard/dashboard_screen.dart';
import 'package:spreadx_web/View/Drawer/menu_drawer.dart';
import 'package:spreadx_web/View/Reports/reports_view.dart';
import 'package:spreadx_web/View/Sales/product_wise_report.dart';
import 'package:spreadx_web/View/Sales/sales_report.dart';
import 'package:spreadx_web/View/Transactions/transaction_list.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  DrawerState drawerState = DrawerState.Dashboard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          switch (drawerState) {
            case DrawerState.Sales:
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuDrawerView(onTap: setDrawerState),
                    Expanded(child: SalesReportView())
                  ]);
            case DrawerState.Product:
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuDrawerView(onTap: setDrawerState),
                    const Expanded(child: ProductWiseReportView())
                  ]);
            case DrawerState.Inventory:
              return Row(children: [
                MenuDrawerView(onTap: setDrawerState),
                DashboardScreenView()
              ]);
            case DrawerState.Transactions:
              return Row(children: [
                MenuDrawerView(onTap: setDrawerState),
                const Expanded(child: TransactionListView())
              ]);
            case DrawerState.Report:
              return Row(children: [
                MenuDrawerView(onTap: setDrawerState),
                const Expanded(child: ReportsView())
              ]);

            default:
              return Row(
                children: [
                  MenuDrawerView(onTap: setDrawerState),
                  DashboardScreenView()
                ],
              );
          }
        },
      ),
    );
  }

  setDrawerState(state) {
    drawerState = state;
    setState(() {});
  }
}
