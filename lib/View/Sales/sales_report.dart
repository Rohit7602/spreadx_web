// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Sales/Widget/sales_component.dart';
import 'package:spreadx_web/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesReportView extends StatelessWidget {
  SalesReportView({super.key});

  List<SaleData> data = [
    SaleData('Jan', "35"),
    SaleData('Feb', "28"),
    SaleData('Mar', "34"),
    SaleData('Apr', "32"),
    SaleData('May', "40")
  ];

  @override
  Widget build(BuildContext context) {
    return

        //  Scaffold(
        //   appBar: CustomAppbarView(title: "Sales Reports"),
        //   backgroundColor: styleSheet.colors.bgColor,
        //   body:

        SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ...List.generate(LocalData.salesReportList.length, (i) {
              var report = LocalData.salesReportList[i];
              return SalesComponentCard(
                  title: report.title,
                  description: report.description,
                  icon: report.icon,
                  onPressed: () {});
            })
          ],
        ),
        styleSheet.appConfig.addHeight(30),
        Container(
          padding: styleSheet.DECORATION.PADDING_20,
          decoration: BoxDecoration(
            borderRadius: styleSheet.DECORATION.RADIUS_10,
            color: styleSheet.COLOR.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Report Graph",
                style: styleSheet.TEXT_THEME.fs18Bold,
              ),
              styleSheet.appConfig.addHeight(10),
              Text(
                "Manage and view sales report, monitor products sales progress in the report graph",
                style: styleSheet.TEXT_THEME.fs16Medium,
              ),
              styleSheet.appConfig.addHeight(10),
              SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  // Chart title
                  title: const ChartTitle(text: 'Half yearly sales analysis'),
                  // Enable legend
                  legend: const Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<SaleData, String>>[
                    LineSeries<SaleData, String>(
                        dataSource: data,
                        xValueMapper: (SaleData sales, _) => sales.month,
                        yValueMapper: (SaleData sales, _) =>
                            int.parse(sales.amount),
                        name: 'Sales',
                        // Enable data label
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true))
                  ]),
            ],
          ),
        )
      ],
    ).paddingAll(25));
    // );
  }
}

class SaleData {
  String month, amount;

  SaleData(this.month, this.amount);
}
