import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Button/icon_btn.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Transactions/Widget/invoice_detail_card.dart';
import 'package:spreadx_web/View/Transactions/Widget/summary_card.dart';
import 'package:spreadx_web/main.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return

        //  Scaffold(
        //   appBar: CustomAppbarView(title: "Transaction"),
        //   body:

        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Product's ( 1 )",
              style: styleSheet.TEXT_THEME.fs20Bold,
            ),
            Row(
              children: [
                IconBtnView(icon: styleSheet.icons.shareIcon, onPressed: () {}),
                styleSheet.appConfig.addWidth(20),
                IconBtnView(
                    icon: styleSheet.icons.refundIcon, onPressed: () {}),
                styleSheet.appConfig.addWidth(20),
                IconBtnView(
                    icon: styleSheet.icons.receiptIcon, onPressed: () {}),
                styleSheet.appConfig.addWidth(20),
                IconBtnView(icon: styleSheet.icons.printIcon, onPressed: () {}),
              ],
            )
          ],
        ),
        styleSheet.appConfig.addHeight(30),
        Expanded(
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: styleSheet.COLOR.whiteColor,
                        boxShadow: styleSheet.DECORATION.secondaryShadow,
                        borderRadius: styleSheet.DECORATION.RADIUS_5),
                    child: DataTable2(
                        dataRowHeight: 40,
                        headingRowHeight: 30,
                        columnSpacing: 5,
                        horizontalMargin: 12,
                        columns: [
                          DataColumn2(
                            fixedWidth: view.tableSmallWidth,
                            label: const Text('No.'),
                            size: ColumnSize.L,
                          ),
                          const DataColumn2(
                            label: Text('Description'),
                          ),
                          DataColumn2(
                            fixedWidth: view.tableSmallWidth,
                            label: const Text('Price'),
                          ),
                          DataColumn2(
                            fixedWidth: view.tableSmallWidth,
                            label: const Text('Qty'),
                          ),
                          DataColumn2(
                            fixedWidth: view.tableSmallWidth,
                            label: const Text('Total'),
                            numeric: true,
                          ),
                        ],
                        rows: List<DataRow>.generate(
                            20,
                            (index) => DataRow(cells: [
                                  DataCell(Text("${(index + 1)}.".toString())),
                                  const DataCell(
                                      Text("Sales About My Product")),
                                  const DataCell(Text("\u{20B9} 150")),
                                  const DataCell(Text('10')),
                                  const DataCell(Text("\u{20B9} 150")),
                                ]))),
                  ),
                ),
                styleSheet.appConfig.addWidth(20),
                Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const InvoiceDetailCard(),
                        styleSheet.appConfig.addHeight(20),
                        const SummaryCard()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20, vertical: 20);
    // );
  }
}
