// ignore_for_file: must_be_immutable

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dialog/apply_discount.dart';
import 'package:spreadx_web/Components/Dialog/assign_customer_dialog.dart';
import 'package:spreadx_web/Components/Dialog/custom_item_dialog.dart';
import 'package:spreadx_web/Components/Dialog/product_check.dart';
import 'package:spreadx_web/Components/Dialog/update_item_quantity.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Dashboard/Widget/product_check.dart';
import 'package:spreadx_web/main.dart';

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  var btnList = LocalData.buttonList;

  bool isProductCheck = false;

  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return

        // Scaffold(
        //   appBar: CustomAppbarView(
        //     title: "Dashboard",
        //     showLeading: false,
        //   ),
        //   body:

        Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget to show Drawer Section
          // MenuDrawerView(),
          Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tools Categories",
                            style: styleSheet.TEXT_THEME.fs18Bold
                                .copyWith(color: styleSheet.COLOR.blackColor),
                          ),
                          styleSheet.appConfig.addHeight(4),
                          Text(
                            "use slide to access all funcationlity",
                            style: styleSheet.TEXT_THEME.fs14Normal
                                .copyWith(color: styleSheet.COLOR.greyColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(10),
                  Row(
                    children: [
                      const Expanded(
                        child: PrimaryTextFormField(
                          hinttext: "Enter Amount",
                        ),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      const Expanded(
                        child: PrimaryTextFormField(
                          hinttext: "Enter Quantity",
                        ),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      SecondaryButtonView(
                        btnName: "Add",
                        onPressed: () {},
                      )
                    ],
                  ),
                  styleSheet.appConfig.addHeight(10),
                  Expanded(
                    flex: 3,
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
                        5,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text("${(index + 1)}.".toString())),
                            const DataCell(Text("Sales About My Product")),
                            const DataCell(Text("\u{20B9} 150")),
                            const DataCell(Text('10')),
                            const DataCell(Text("\u{20B9} 150")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      ...List.generate(btnList.length, (i) {
                        return SecondaryButtonView(
                          btnName: btnList[i].title,
                          onPressed: () =>
                              getButtonRoute(btnList[i].title, context),
                        );
                      })
                    ],
                  ).paddingAll(20),
                ],
              ),
            ),
          ),
          styleSheet.appConfig.addWidth(30),
          isProductCheck
              ? const ProductCheckView()
              : SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: view.dashboardSummaryCardWidth,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: styleSheet.COLOR.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Summary",
                          style: styleSheet.TEXT_THEME.fs14Medium
                              .copyWith(color: styleSheet.COLOR.greyColor),
                        ),
                        const Divider().paddingSymmetric(vertical: 8),
                        CustomRow(
                            title: "Sub Total EXC VAT",
                            trailing: "\u{20B9} 120"),
                        styleSheet.appConfig.addHeight(6),
                        CustomRow(
                            title: "Discount %", trailing: "\u{20B9} 120"),
                        styleSheet.appConfig.addHeight(6),
                        CustomRow(
                            title: "Total Tax %", trailing: "\u{20B9} 120"),
                        styleSheet.appConfig.addHeight(6),
                        CustomRow(title: "VAT", trailing: "\u{20B9} 120"),
                        const Divider().paddingSymmetric(vertical: 8),
                        CustomRow(title: "Total", trailing: "\u{20B9} 120"),
                        styleSheet.appConfig.addHeight(6),
                        CustomRow(title: "Balance", trailing: "\u{20B9} 120"),
                        const Divider().paddingSymmetric(vertical: 8),
                        Text(
                          "Mode of Payment",
                          style: view.textFontMedium
                              .copyWith(color: styleSheet.COLOR.greyColor),
                        ),
                        styleSheet.appConfig.addHeight(10),
                        Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedValue = value!;
                                    });
                                  },
                                ),
                                const Text('Cash')
                              ],
                            ),
                            styleSheet.appConfig.addWidth(20),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedValue = value!;
                                    });
                                  },
                                ),
                                const Text('Card')
                              ],
                            ),
                          ],
                        ),
                        styleSheet.appConfig.addHeight(12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlineButtonView(
                                  btnColor: styleSheet.COLOR.whiteColor,
                                  txtColor: styleSheet.COLOR.blackColor,
                                  btnName: "Split & Pay",
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                        styleSheet.appConfig.addHeight(8),
                        Row(
                          children: [
                            Expanded(
                              child: SecondaryButtonView(
                                  btnName: "Checkout", onPressed: () {}),
                            ),
                          ],
                        ),
                        const Text("Keypad ( use it for filling number’s )")
                            .paddingSymmetric(vertical: 12),
                        GridView.builder(
                          itemCount: LocalData.keyboardBtnList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: view.keyboardBtnSize),
                          itemBuilder: (context, i) {
                            var btn = LocalData.keyboardBtnList[i];
                            return SecondaryButtonView(
                                btnColor: styleSheet.COLOR.primaryColor,
                                btnName: btn.btnName,
                                onPressed: () {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  getButtonRoute(String route, context) {
    switch (route.toLowerCase()) {
      case "discount":
        return showDialog(
            context: context,
            builder: (context) => const ApplyDiscountDialog());
      case "assign customer":
        return showDialog(
            context: context,
            builder: (context) => const AssignCustomerDialog());
      case "custom item":
        return showDialog(
            context: context, builder: (context) => const CustomItemDialog());
      case "product check":
        return showDialog(
            context: context, builder: (context) => const ProductCheckDialog());
      case "update qty":
        return showDialog(
            context: context,
            builder: (context) => const UpdateItemQuantityDialog());
      case "products":
        return setState(() {
          isProductCheck = !isProductCheck;
        });

      default:
        return null;
    }
  }
}
