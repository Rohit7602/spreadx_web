// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/View/Dashboard/dashboard_screen.dart';
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
              return SalesReportView();
            case DrawerState.Product:
              return const ProductWiseReportView();
            case DrawerState.Inventory:
              return const DashboardScreenView();
            case DrawerState.Transactions:
              return const TransactionListView();
            case DrawerState.Report:
              return const ReportsView();

            default:
              return const DashboardScreenView();
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


              //  MenuDrawerView(onTap: setDrawerState),