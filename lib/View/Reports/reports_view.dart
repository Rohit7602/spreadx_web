import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/custom_grid.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Drawer/drawer_view.dart';
import 'package:spreadx_web/View/Reports/Widget/report_dash_card.dart';
import 'package:spreadx_web/View/Sales/sales_report.dart';
import 'package:spreadx_web/View/Sales/sales_summary.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  RxString selectedView = RxString("default");

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
            selectedView.value = report.title;
            setState(() {});
          },
        );
      },
    );

    return Stack(
      children: [
        Obx(() {
          if (selectedView.value.toLowerCase() == "sales") {
            return const SalesReportView();
          } else if (selectedView.value.toLowerCase() == "sales summary") {
            return const SalesSummaryView();
          } else if (selectedView.value.toLowerCase() == "drawers") {
            return const DrawerView();
          } else {
            return defaultView;
          }
        }),
        selectedView.value.toLowerCase() == "default"
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  selectedView("default");
                  setState(() {});
                },
                icon: const Icon(Icons.arrow_back),
              )
      ],
    );
  }
}
