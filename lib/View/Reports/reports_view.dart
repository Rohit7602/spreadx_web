import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/custom_grid.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Drawer/drawer_view.dart';
import 'package:spreadx_web/View/Reports/Widget/report_dash_card.dart';
import 'package:spreadx_web/View/Reports/vat_report_view.dart';
import 'package:spreadx_web/View/Sales/sales_report.dart';
import 'package:spreadx_web/View/Sales/sales_summary.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  Rx<ReportState> selectedView = Rx<ReportState>(ReportState.Default);

  @override
  Widget build(BuildContext context) {
    var defaultView = GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: LocalData.reportList.length,
      gridDelegate: CustomSliverGridDelegate(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          itemHeight: 150),
      itemBuilder: (context, i) {
        var report = LocalData.reportList[i];
        return ReportDashboardCard(
          title: report.title,
          description: report.description,
          onPressed: () {
            if (i == 0) {
              selectedView(ReportState.Sales);
            } else if (i == 1) {
              selectedView(ReportState.Drawers);
            } else if (i == 2) {
              selectedView(ReportState.Sales_Summary);
            } else if (i == 3) {
              selectedView(ReportState.VAT_Report);
            }
          },
        );
      },
    );

    return Obx(() => getView(selectedView.value, defaultView));
  }

  getView(state, defaultView) {
    switch (state) {
      case ReportState.Sales:
        return SalesReportView(
          onPressedBack: setDefaultView,
        );
      case ReportState.Sales_Summary:
        return SalesSummaryView(
          onPressedBack: setDefaultView,
        );
      case ReportState.Drawers:
        return DrawerView(
          onPressedBack: setDefaultView,
        );
      case ReportState.VAT_Report:
        return const VatReportView();

      default:
        return defaultView;
    }
  }

  setDefaultView() => selectedView(ReportState.Default);
}
