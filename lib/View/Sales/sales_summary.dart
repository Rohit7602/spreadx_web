import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';

class SalesSummaryView extends StatefulWidget {
  void Function() onPressedBack;
  SalesSummaryView({required this.onPressedBack, super.key});

  @override
  State<SalesSummaryView> createState() => _SalesSummaryViewState();
}

class _SalesSummaryViewState extends State<SalesSummaryView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  String fromDate = DateTime.now().toString();
  String endDate = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    width: styleSheet.appConfig.getScreenWidth(context),
                    color: styleSheet.COLOR.lightBlueColor,
                    child: TabBar(
                        indicatorColor: styleSheet.COLOR.primaryColor,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: styleSheet.TEXT_THEME.fs12Medium
                            .copyWith(color: styleSheet.COLOR.primaryColor),
                        unselectedLabelStyle: styleSheet.TEXT_THEME.fs12Medium
                            .copyWith(color: styleSheet.COLOR.blackColor),
                        controller: tabController,
                        tabs: [
                          ...List.generate(LocalData.salesSummaryDayWise.length,
                              (i) {
                            return Tab(
                              text: LocalData.salesSummaryDayWise[i],
                            );
                          })
                        ]),
                  ),
                  Container(
                    margin: styleSheet.DECORATION.PADDING_20,
                    padding: styleSheet.DECORATION.PADDING_10,
                    decoration: BoxDecoration(
                      borderRadius: styleSheet.DECORATION.RADIUS_5,
                      color: styleSheet.COLOR.whiteColor,
                    ),
                    child: tabController.index == 5
                        ? Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text("From"),
                                    styleSheet.appConfig.addWidth(30),
                                    GestureDetector(
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2050))
                                            .then((val) {
                                          if (val != null) {
                                            fromDate = val.toString();
                                            setState(() {});
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  styleSheet.COLOR.greyColor),
                                          borderRadius:
                                              styleSheet.DECORATION.RADIUS_5,
                                        ),
                                        child: Text(
                                          fromDate,
                                          style:
                                              styleSheet.TEXT_THEME.fs12Medium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              styleSheet.appConfig.addWidth(20),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    const Text("To"),
                                    styleSheet.appConfig.addWidth(30),
                                    GestureDetector(
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2050))
                                            .then((val) {
                                          if (val != null) {
                                            endDate = val.toString();
                                            setState(() {});
                                          }
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  styleSheet.COLOR.greyColor),
                                          borderRadius:
                                              styleSheet.DECORATION.RADIUS_5,
                                        ),
                                        child: Text(
                                          endDate,
                                          style:
                                              styleSheet.TEXT_THEME.fs12Medium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Container(
                            constraints: BoxConstraints(
                                maxHeight: styleSheet.appConfig
                                        .getScreenHeight(context) *
                                    0.63),
                            child: SingleChildScrollView(
                              child: Wrap(
                                runSpacing: 15,
                                children: [
                                  CustomRow(
                                      title: "No. of Invoices", trailing: "0"),
                                  CustomRow(
                                      title: "No. of   Refunds", trailing: "0"),
                                  const Divider(),
                                  CustomRow(
                                      title: "Cash Transactions",
                                      trailing: "AED 0.00"),
                                  CustomRow(
                                      title: "Credit Transactions",
                                      trailing: "AED 0.00"),
                                  CustomRow(
                                      title: "Refund Transactions",
                                      trailing: "AED 0.00"),
                                  CustomRow(
                                      title: "Total Sales",
                                      trailing: "AED 0.00"),
                                  const Divider(),
                                  CustomRow(
                                      title: "Gross Sales",
                                      trailing: "AED 0.00"),
                                  CustomRow(
                                      title: "Total Discount",
                                      trailing: "AED 0.00"),
                                  CustomRow(
                                      title: "Net Total", trailing: "AED 0.00"),
                                  CustomRow(
                                      title: "Grand Total",
                                      trailing: "AED 0.00"),
                                  const Divider(),
                                  CustomRow(
                                      title: "Cash Received",
                                      trailing: "AED 0.00"),
                                  CustomRow(
                                      title: "Card Received",
                                      trailing: "AED 0.00"),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              Row(
                children: [
                  PrimaryBtnWithIcon(
                      isExpanded: true,
                      btnName: "Print",
                      onPressed: () {},
                      icon: Icons.print),
                  styleSheet.appConfig.addWidth(10),
                  PrimaryBtnWithIcon(
                      isExpanded: true,
                      btnName: "Share",
                      onPressed: () {},
                      icon: Icons.share),
                ],
              ).paddingOnly(left: 20, bottom: 20, right: 20, top: 10)
            ],
          ),
          IconButton(
              onPressed: widget.onPressedBack, icon: Icon(Icons.arrow_back))
        ],
      ),
    );
  }
}
