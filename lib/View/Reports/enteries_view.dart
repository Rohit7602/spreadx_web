import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/main.dart';

class EnteriesView extends StatelessWidget {
  void Function() onPressedBack;
  EnteriesView({required this.onPressedBack, super.key});

  var entryData = LocalData.entryTrList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 2200,
            height: styleSheet.appConfig.getScreenHeight(context) * 0.4,
            child: DataTable2(
              dataRowHeight: 40,
              headingRowHeight: 30,
              columnSpacing: 5,
              horizontalMargin: 12,
              columns: const [
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Transaction No.'),
                ),
                DataColumn2(
                  label: Text('Transaction Type'),
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Transaction Date'),
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Customer Name'),
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Prodcut Name'),
                  numeric: true,
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Qty'),
                  numeric: true,
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Price'),
                  numeric: true,
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Line Total'),
                  numeric: true,
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Discount'),
                  numeric: true,
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Net Total'),
                  numeric: true,
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('VAT Type'),
                  numeric: true,
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('VAT Amount'),
                  numeric: true,
                ),
                DataColumn2(
                  // fixedWidth: view.tableSmallWidth,
                  label: Text('Total'),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                entryData.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text(entryData[index].trNumber)),
                    DataCell(Text(entryData[index].type)),
                    DataCell(Text(entryData[index].date)),
                    DataCell(Text(entryData[index].customerName)),
                    DataCell(Text(entryData[index].productName)),
                    DataCell(Text(entryData[index].qty)),
                    DataCell(Text(entryData[index].price)),
                    DataCell(Text(entryData[index].lineTotal)),
                    DataCell(Text(entryData[index].discount)),
                    DataCell(Text(entryData[index].netTotal)),
                    DataCell(Text(entryData[index].vatType)),
                    DataCell(Text(entryData[index].vatAmount)),
                    DataCell(Text(entryData[index].total)),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
