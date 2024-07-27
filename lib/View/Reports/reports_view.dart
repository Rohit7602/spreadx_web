import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Reports/Widget/report_dash_card.dart';
import 'package:spreadx_web/main.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return

        // Scaffold(
        //   backgroundColor: styleSheet.colors.bgColor,
        //   appBar: CustomAppbarView(title: "Reports"),
        //   body:

        GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: LocalData.reportList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: view.reportCardAspectRatio,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (context, i) {
        var report = LocalData.reportList[i];
        return ReportDashboardCard(
            title: report.title,
            description: report.description,
            icon: report.icon,
            onPressed: () {
              context.go(MyRoute.drawerView);
            });
      },
    );
    // );
  }
}
